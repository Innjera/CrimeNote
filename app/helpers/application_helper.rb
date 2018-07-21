module ApplicationHelper
  def default_meta_tags
    {
      site: 'CrimeNote',
      title: 'Top',
      reverse: true,
      charset: 'utf-8',
      description: '海外に暮らす、渡航する日本人の為の犯罪情報シェアサイトです。土地勘の無い方でもどこで、どんな犯罪が起きているか分かるよう、マップが表示されます。',
      keywords: '海外駐在、海外で暮らす、海外危険情報、海外犯罪、強盗、ひったくり、スキミング、盗難、スリ',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'CrimeNote',
        title:
        if @note
          "Crime Note about #{@note.crime_category} happened at #{@note.address}"
        else 'CrimeNote'
        end,
        description:
        if @note
          @note.situation
        else
          '海外に暮らす、渡航する日本人の為の犯罪情報シェアサイトです。土地勘の無い方でもどこで、どんな犯罪が起きているか分かるよう、マップが表示されます。'
        end,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.JPG'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@NoMoreCopHarass',
      }
    }
  end
end
