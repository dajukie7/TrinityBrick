using System.Web.Mvc;

namespace TrinityBrick.Extensions
{
    public static class HtmlHelpers
    {
        public static string ActiveLink(this HtmlHelper html, string activeLink)
        {
            if ((html.ViewData["ActiveLink"] != null) && ((string) html.ViewData["ActiveLink"] == activeLink))
                return "active";

            return "";
        }

    }
}