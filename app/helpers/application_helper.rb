module ApplicationHelper
  def default_meta_tags
    {
      site: 'CrimeNote',
      title: 'Top',
      reverse: true,
      charset: 'utf-8',
      description: 'アフリカで働く、アフリカで暮らす、アフリカに旅する日本人の為の犯罪情報シェアサイトです。土地勘の無い方でもどこで、どんな犯罪が起きているか分かるよう、マップが表示されます。',
      keywords: '海外駐在、アフリカに住む、アフリカで暮らす、アフリカで遊ぶ、アフリカ危険情報、アフリカ犯罪、強盗、ひったくり、スキミング、盗難、スリ、アフリカ、危険',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'CrimeNote',
        title:
        if @note
          "[Crime Note|#{@note.address_country_part}] #{@note.crime_category}が#{@note.address}で発生しました。"
        else 'CrimeNote'
        end,
        description:
        if @note
          @note.situation
        else
          'アフリカで働く、アフリカで暮らす、アフリカに旅する日本人の為の犯罪情報シェアサイトです。土地勘の無い方でもどこで、どんな犯罪が起きているか分かるよう、マップが表示されます。'
        end,
        type: 'website',
        url: request.original_url,
        image: image_url('new_logo.JPG'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@NoteCrime',
      }
    }
  end
end
