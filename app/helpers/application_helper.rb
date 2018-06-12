module ApplicationHelper
  def default_meta_tags
    {
      site: 'CrimeNote',
      title: 'Top',
      reverse: true,
      charset: 'utf-8',
      description: 'This is App in which we share crime stories we experienced ans heared in South Africa. So that we could be informed of the crime which have not been reported to the authority.',
      keywords: 'South Africa, Africa, johannesburg, crime, robbery, theft, carjacking, fake police, murder, inocent citizen, sandton, Cape Town, durban',
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
          'This is a App which we share crime story we experienced, heared in South Africa. So that we could be informed of the crime which have not been reported to the authority.'
        end,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.JPG'),
        locale: 'es_ES',
      },
      twitter: {
        card: 'summary',
        site: '@NoMoreCopHarass',
      }
    }
  end
end
