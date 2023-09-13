using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserRegistrationSystemApp.DataAccess;
using UserRegistrationSystemApp.Queries;


namespace UserRegistrationSystemApp
{
    public partial class _Default : Page
    {
        UserQueries qury = new UserQueries();

        protected void Page_Load(object sender, EventArgs e)
        {

            spanFullName.InnerText = "";
            spanEmail.InnerText = "";
            spanMobileNumber.InnerText = "";
            spanAddress.InnerText = "";
            spanUsername.InnerText = "";
            spanPassword.InnerText = "";


        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobileNumber = txtMobileNumber.Text.Trim();
            string address = txtAddress.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            if (string.IsNullOrEmpty(fullName) || !IsAlphaNumericWithSpaces(fullName))
            {
                spanFullName.InnerText = "Full Name is required and should only contain letters and numbers no special character.";
                spanFullName.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(email) || !IsValidEmail(email))
            {
                spanEmail.InnerText = "Email is required and should be a valid email address.";
                spanEmail.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(mobileNumber) || !IsNumeric(mobileNumber) || mobileNumber.Contains(" "))
            {
                spanMobileNumber.InnerText = "Mobile Number is required, should be numeric, and should not contain spaces.";
                spanEmail.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(address) || IsAlphaNumericWithSpaces(address))
            {
                spanAddress.InnerText = "Address is required and should only contain letters, numbers, and spaces.";
                spanEmail.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(username) || !IsAlphaNumeric(username) || username.Length < 6)
            {
                spanUsername.InnerText = "Username is required, should be at least 6 characters long, and should only contain letters and numbers.";
                spanEmail.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(password) || password.Length < 8)
            {
                spanPassword.InnerText = "Password is required and should be at least 8 characters long.";
                spanEmail.Visible = true;
                return;
            }
            bool isUsernameUnique = qury.CheckIfUsernameIsUnique(username);

            if (!isUsernameUnique)
            {
                lblMessage.Text = "Username is already taken.";
                lblMessage.Visible = true;
                return;
            }


            string hashedPassword = qury.HashPassword(password);
            bool registrationSuccess = qury.SaveUserToDatabase(fullName,email, mobileNumber,address,username, hashedPassword);

            if (registrationSuccess)
            {
                lblMessage.Text = "Registration successful.";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Registration failed. Please try again later.";
                lblMessage.Visible = true;
            }
        }
        private bool IsAlphaNumeric(string input)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(input, @"^[a-zA-Z0-9]+$");
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private bool IsNumeric(string input)
        {
            return long.TryParse(input, out _);
        }

        private bool IsAlphaNumericWithSpaces(string input)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(input, @"^[a-zA-Z0-9\s]+$");
        }

    }
}