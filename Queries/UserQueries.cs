using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using UserRegistrationSystemApp.DataAccess;
using System.Web.Security;

namespace UserRegistrationSystemApp.Queries
{
    public class UserQueries
    {
        private readonly DatabaseConnection dbConnection;

        public UserQueries()
        {
            dbConnection = new DatabaseConnection();
        }
        public bool CheckIfUsernameIsUnique(string username)
        {
            using (SqlConnection connection = dbConnection.GetConnection())
            {
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM user_tbl WHERE UserName = @Username", connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count == 0;
                }
            }
        }

        public string HashPassword(string password)
        {
            string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            string hashedPassword = securepass;
            return hashedPassword;
        }



        public bool SaveUserToDatabase(string fullName, string email, string mobileNumber, string address, string username, string hashedPassword)
        {
            string query = "INSERT INTO user_tbl (FullName, Email, MobileNumber, Address, UserName, Password) VALUES (@Fullname,@Email,@MobileNumber,@Address,@Username, @PasswordHash)";

            using (SqlConnection connection = dbConnection.GetConnection())
            using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Fullname", fullName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        return rowsAffected == 1;
                    }
                    catch (Exception ex)
                    {
                        return false;
                    }
                }
           }

    }
}