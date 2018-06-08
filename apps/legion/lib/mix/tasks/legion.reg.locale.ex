defmodule Mix.Tasks.Legion.Reg.Locale do
  require Logger

  import Mix.Ecto

  alias Legion.Repo
  alias Legion.Internationalization.Locale

  Logger.configure level: :info

  defmacrop put_locale(language, abbreviation, variant) do
    quote do
      rfc1766 =
        if unquote(variant) do
          unquote("#{abbreviation}-#{variant}")
        else
          unquote(abbreviation)
        end

      try do
        Repo.insert!(%Locale{rfc1766: rfc1766, language: unquote(language), abbreviation: unquote(abbreviation), variant: unquote(variant)})

        Logger.info fn ->
          "added locale #{rfc1766}"
        end
      rescue
        Ecto.ConstraintError ->
          Logger.warn fn ->
            "cannot add locale #{rfc1766}, it is already loaded"
          end
      end
    end
  end

  def run(_args) do
    {:ok, pid, _apps} = ensure_started(Repo, [])
    sandbox? = Repo.config[:pool] == Ecto.Adapters.SQL.Sandbox

    if sandbox? do
      Ecto.Adapters.SQL.Sandbox.checkin(Repo)
      Ecto.Adapters.SQL.Sandbox.checkout(Repo, sandbox: false)
    end

    Logger.info fn ->
      "== Synchronizing locales"
    end

    put_locale "Afrikaans", "af", nil
    put_locale "Arabic (U.A.E.)", "ar", "ae"
    put_locale "Arabic (Kingdom of Bahrain)", "ar", "bh"
    put_locale "Arabic (Algeria)", "ar", "dz"
    put_locale "Arabic (Egypt)", "ar", "eg"
    put_locale "Arabic (Iraq)", "ar", "iq"
    put_locale "Arabic (Jordan)", "ar", "jo"
    put_locale "Arabic (Kuwait)", "ar", "kw"
    put_locale "Arabic (Lebanon)", "ar", "lb"
    put_locale "Arabic (Libya)", "ar", "ly"
    put_locale "Arabic (Morocco)", "ar", "ma"
    put_locale "Arabic (Oman)", "ar", "om"
    put_locale "Arabic (Qatar)", "ar", "qa"
    put_locale "Arabic (Saudi Arabia)", "ar", "sa"
    put_locale "Arabic (Syria)", "ar", "sy"
    put_locale "Arabic (Tunisia)", "ar", "tn"
    put_locale "Arabic (Yemen)", "ar", "ye"
    put_locale "Arabic", "ar", nil
    put_locale "Assamese", "as", nil
    put_locale "Azerbaijani", "az", nil
    put_locale "Belarusian", "be", nil
    put_locale "Bulgarian", "bg", nil
    put_locale "Bangla", "bn", nil
    put_locale "Catalan", "ca", nil
    put_locale "Czech", "cs", nil
    put_locale "Danish", "da", nil
    put_locale "German (Austria)", "de", "at"
    put_locale "German (Switzerland)", "de", "ch"
    put_locale "German (Liechtenstein)", "de", "li"
    put_locale "German (Luxembourg)", "de", "lu"
    put_locale "German (Germany)", "de", nil
    put_locale "Divehi", "div", nil
    put_locale "Greek", "el", nil
    put_locale "English (Australia)", "en", "au"
    put_locale "English (Belize)", "en", "bz"
    put_locale "English (Canada)", "en", "ca"
    put_locale "English (United Kingdom)", "en", "gb"
    put_locale "English (Ireland)", "en", "ie"
    put_locale "English (Jamaica)", "en", "jm"
    put_locale "English (New Zealand)", "en", "nz"
    put_locale "English (Philippines)", "en", "ph"
    put_locale "English (Trinidad)", "en", "tt"
    put_locale "English (United States)", "en", "us"
    put_locale "English (South Africa)", "en", "za"
    put_locale "English (Zimbabwe)", "en", "zw"
    put_locale "English", "en", nil
    put_locale "Spanish (Argentina)", "es", "ar"
    put_locale "Spanish (Bolivia)", "es", "bo"
    put_locale "Spanish (Chile)", "es", "cl"
    put_locale "Spanish (Colombia)", "es", "co"
    put_locale "Spanish (Costa Rica)", "es", "cr"
    put_locale "Spanish (Dominican Republic)", "es", "do"
    put_locale "Spanish (Ecuador)", "es", "ec"
    put_locale "Spanish (Guatemala)", "es", "gt"
    put_locale "Spanish (Honduras)", "es", "hn"
    put_locale "Spanish (Mexico)", "es", "mx"
    put_locale "Spanish (Nicaragua)", "es", "ni"
    put_locale "Spanish (Panama)", "es", "pa"
    put_locale "Spanish (Peru)", "es", "pe"
    put_locale "Spanish (Puerto Rico)", "es", "pr"
    put_locale "Spanish (Paraguay)", "es", "py"
    put_locale "Spanish (El Salvador)", "es", "sv"
    put_locale "Spanish (United States)", "es", "us"
    put_locale "Spanish (Uruguay)", "es", "uy"
    put_locale "Spanish (Venezuela)", "es", "ve"
    put_locale "Spanish", "es", nil
    put_locale "Estonian", "et", nil
    put_locale "Basque (Basque)", "eu", nil
    put_locale "Persian", "fa", nil
    put_locale "Finnish", "fi", nil
    put_locale "Faeroese", "fo", nil
    put_locale "French (Belgium)", "fr", "be"
    put_locale "French (Canada)", "fr", "ca"
    put_locale "French (Switzerland)", "fr", "ch"
    put_locale "French (Luxembourg)", "fr", "lu"
    put_locale "French (Monaco)", "fr", "mc"
    put_locale "French (France)", "fr", nil
    put_locale "Scottish Gaelic", "gd", nil
    put_locale "Galician", "gl", nil
    put_locale "Gujarati", "gu", nil
    put_locale "Hebrew", "he", nil
    put_locale "Hindi", "hi", nil
    put_locale "Croatian", "hr", nil
    put_locale "Hungarian", "hu", nil
    put_locale "Armenian", "hy", nil
    put_locale "Indonesian", "id", nil
    put_locale "Icelandic", "is", nil
    put_locale "Italian (Switzerland)", "it", "ch"
    put_locale "Italian (Italy)", "it", nil
    put_locale "Japanese", "ja", nil
    put_locale "Georgian", "ka", nil
    put_locale "Kazakh", "kk", nil
    put_locale "Kannada", "kn", nil
    put_locale "Korean", "ko", nil
    put_locale "Konkani", "kok", nil
    put_locale "Kyrgyz", "kz", nil
    put_locale "Lithuanian", "lt", nil
    put_locale "Latvian", "lv", nil
    put_locale "Macedonian (FYROM)", "mk", nil
    put_locale "Malayalam", "ml", nil
    put_locale "Mongolian (Cyrillic)", "mn", nil
    put_locale "Marathi", "mr", nil
    put_locale "Malay", "ms", nil
    put_locale "Maltese", "mt", nil
    put_locale "Norwegian (Bokmal)", "nb", "no"
    put_locale "Nepali (India)", "ne", nil
    put_locale "Dutch (Belgium)", "nl", "be"
    put_locale "Dutch (Netherlands)", "nl", nil
    put_locale "Norwegian (Nynorsk)", "nn", "no"
    put_locale "Norwegian (Bokmal)", "no", nil
    put_locale "Odia", "or", nil
    put_locale "Punjabi", "pa", nil
    put_locale "Polish", "pl", nil
    put_locale "Portuguese (Brazil)", "pt", "br"
    put_locale "Portuguese (Portugal)", "pt", nil
    put_locale "Rhaeto-Romanic", "rm", nil
    put_locale "Romanian (Moldova)", "ro", "md"
    put_locale "Romanian", "ro", nil
    put_locale "Russian (Moldova)", "ru", "md"
    put_locale "Russian", "ru", nil
    put_locale "Sanskrit", "sa", nil
    put_locale "Sorbian", "sb", nil
    put_locale "Slovak", "sk", nil
    put_locale "Slovenian", "sl", nil
    put_locale "Albanian", "sq", nil
    put_locale "Serbian", "sr", nil
    put_locale "Swedish (Finland)", "sv", "fi"
    put_locale "Swedish", "sv", nil
    put_locale "Swahili", "sw", nil
    put_locale "Sutu", "sx", nil
    put_locale "Syriac", "syr", nil
    put_locale "Tamil", "ta", nil
    put_locale "Telugu", "te", nil
    put_locale "Thai", "th", nil
    put_locale "Tswana", "tn", nil
    put_locale "Turkish", "tr", nil
    put_locale "Tsonga", "ts", nil
    put_locale "Tatar", "tt", nil
    put_locale "Ukrainian", "uk", nil
    put_locale "Urdu", "ur", nil
    put_locale "Uzbek", "uz", nil
    put_locale "Vietnamese", "vi", nil
    put_locale "Xhosa", "xh", nil
    put_locale "Yiddish", "yi", nil
    put_locale "Chinese (China)", "zh", "cn"
    put_locale "Chinese (Hong Kong SAR)", "zh", "hk"
    put_locale "Chinese (Macao SAR)", "zh", "mo"
    put_locale "Chinese (Singapore)", "zh", "sg"
    put_locale "Chinese (Taiwan)", "zh", "tw"
    put_locale "Chinese", "zh", nil
    put_locale "Zulu", "zu", nil

    sandbox? && Ecto.Adapters.SQL.Sandbox.checkin(Repo)

    pid && Repo.stop(pid)

    Logger.info fn ->
      "== Finished synchronizing locales"
    end
  end
end
