using System.Threading.Tasks;

namespace XamarinFirebaseDemo
{
    public interface IAuth
    {
        Task<bool> LoginWithEmailPassword(string email, string password);
        Task<bool> SignUpWithEmailPassword(string email, string password);
    }
}