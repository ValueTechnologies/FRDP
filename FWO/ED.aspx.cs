using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FRDP
{
    public partial class ED : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEncrypt_Click(object sender, EventArgs e)
        {
            EncryptDecrypt.EncryptConnString();
        }

        protected void btnDecrypt_Click(object sender, EventArgs e)
        {
            EncryptDecrypt.DecryptConnString();
        }
    }

    public class EncryptDecrypt
    {
        //Get Application path using HttpContext 
        public static string path = HttpContext.Current.Request.ApplicationPath;
        /// <summary> 
        /// Encrypt web.config connectionStrings
        /// section using Rsa protected configuration
        /// provider model 
        /// </summary> 
        #region Encrypt method
        public static void EncryptConnString()
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            ConfigurationSection configSection = config.GetSection("connectionStrings");
            if (!configSection.SectionInformation.IsProtected)
            {
                configSection.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
                config.Save();
                //Response.Write("ConnectionStrings has been encryted successfully.");
            }
            else
            {
                //Response.Write("ConnectionStrings has been encryted, this action has been cancled");
            }
        }
        #endregion
        /// <summary> 
        /// Decrypts connectionStrings section in 
        ///web.config using Rsa provider model 
        /// </summary> 
        #region Decrypt method
        public static void DecryptConnString()
        {

            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            ConfigurationSection configSection = config.GetSection("connectionStrings");
            if (configSection.SectionInformation.IsProtected)
            {
                configSection.SectionInformation.UnprotectSection();
                config.Save();
                //Response.Write("ConnectionStrings has been encryted successfully.");
            }
            else
            {
                //Response.Write("ConnectionStrings has been encryted, this action has been cancled");
            }


        }
        #endregion
    } 

    
}