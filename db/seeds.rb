# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
scripts = [
  {
    title: "Entering the Room",
    slug: "entering-the-room",
    tradition: "Soto Zen",
    summary: "A brief opening script for settling into posture, breath, and ordinary awareness.",
    source_note: "Original public-use meditation script written for this app.",
    body: <<~TEXT
      Enter the room without needing to improve the room.

      Sit down with the care you would give to setting a bowl on a table. Let the spine rise without stiffness. Let the hands rest. Let the jaw soften.

      Notice the first breath that arrives by itself. Do not hold it. Do not decorate it. Let the breath show you how the body is already practicing.

      Sounds may come and go. Thoughts may come and go. Let each one bow and pass through the wide doorway of attention.

      For these few minutes, nothing needs to be solved. Sit as the whole room sitting.
    TEXT
  },
  {
    title: "The Breath Before the Question",
    slug: "breath-before-the-question",
    tradition: "Soto Zen",
    summary: "A reflection for meeting questions without rushing into answers.",
    source_note: "Original public-use meditation script written for this app.",
    body: <<~TEXT
      Bring to mind a question you have been carrying.

      Before answering, feel the body that carries it. Feel the floor. Feel the weight of the hands. Let the question become simple enough to breathe with.

      Inhaling, allow the question to be present. Exhaling, release the demand that it change quickly.

      Zen practice does not ask us to become blank. It invites us to meet what is here without tightening around it.

      Rest in the breath before the question. Rest again. Let the next right step become visible in its own time.
    TEXT
  },
  {
    title: "Just This Bowl",
    slug: "just-this-bowl",
    tradition: "Soto Zen",
    summary: "A meditation on simplicity, receiving, and giving attention to one ordinary thing.",
    source_note: "Original public-use meditation script written for this app.",
    body: <<~TEXT
      Imagine a plain bowl resting before you.

      It does not ask to be admired. It does not apologize for being empty. Its openness is its work.

      Let the body be like this bowl. Open enough to receive the breath. Simple enough to hold a sound, a feeling, a thought, and then release it.

      When attention wanders, return without ceremony. This breath. This posture. This ordinary life.

      Nothing is missing from just this bowl.
    TEXT
  },
  {
    title: "Walking Back to Stillness",
    slug: "walking-back-to-stillness",
    tradition: "Soto Zen",
    summary: "A short script for moving from daily activity into seated reflection.",
    source_note: "Original public-use meditation script written for this app.",
    body: <<~TEXT
      Let the pace of the day arrive with you.

      There may be unfinished tasks, conversations, plans, and small concerns still moving through the mind. Do not push them away. Let them take off their shoes at the door.

      Feel the breath at the center of the body. Feel the stillness that does not oppose movement.

      Each exhale is a step back. Back from urgency. Back from performance. Back into the life that is already here.

      Sit steadily. Let stillness walk the rest of the way toward you.
    TEXT
  }
]

scripts.each_with_index do |attributes, index|
  Literature.find_or_initialize_by(slug: attributes[:slug]).tap do |literature|
    literature.assign_attributes(attributes.merge(position: index + 1))
    literature.save!
  end
end

throssel_attribution = "Source: Throssel Hole Buddhist Abbey downloads page. Linked here for access and discussion; text/audio remains with the original publisher or rights holder."
download_intro = "Open the linked file from Throssel, then use this page for questions, notes, and practice discussion."

downloads = [
  {
    title: "Sitting Buddha: Zen Meditation for Everyone",
    slug: "throssel-sitting-buddha-pdf",
    resource_kind: "Book",
    resource_format: "PDF",
    resource_url: "https://throssel.org.uk/wp-content/uploads/2025/02/sitting_buddha_daishinmorgan.pdf",
    summary: "Rev. Master Daishin Morgan's book on Zen meditation, offered by Throssel as a downloadable PDF.",
    body: download_intro
  },
  {
    title: "Sitting Buddha: Audiobook",
    slug: "throssel-sitting-buddha-audiobook",
    resource_kind: "Book",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=1k7fp5pP_AHL-x5T1PsHnOwvyNyr8GIK9",
    summary: "Audiobook version of Rev. Master Daishin Morgan's Sitting Buddha.",
    body: download_intro
  },
  {
    title: "Buddha Recognises Buddha: Audiobook",
    slug: "throssel-buddha-recognises-buddha-audiobook",
    resource_kind: "Book",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=1IFrQAebnCb-ugsfpt9xVSjMXVvAbipYT",
    summary: "MP3 audiobook download of Rev. Master Daishin Morgan's Buddha Recognises Buddha.",
    body: download_intro
  },
  {
    title: "Delving: Ebook",
    slug: "throssel-delving-ebook",
    resource_kind: "Book",
    resource_format: "Ebook",
    resource_url: "https://drive.google.com/uc?export=download&id=1ZD12r1X85QWLGtL35Me7BdUKX44iVuBB",
    summary: "Downloadable ebook offered by Throssel as a dana resource.",
    body: download_intro
  },
  {
    title: "Delving: Audiobook",
    slug: "throssel-delving-audiobook",
    resource_kind: "Book",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=13Fmsd-OHJzXQmAUFBajpJJgt756OO4U8",
    summary: "Audiobook download of Delving.",
    body: download_intro
  },
  {
    title: "Serene Reflection Meditation Leaflet",
    slug: "throssel-serene-reflection-meditation-leaflet",
    resource_kind: "Leaflet",
    resource_format: "PDF",
    resource_url: "https://throssel.org.uk/wp-content/uploads/2026/04/srm2026thba.pdf",
    summary: "Three-fold leaflet from Throssel introducing the basics of Serene Reflection Meditation practice.",
    body: download_intro
  },
  {
    title: "Daily Scriptures: Alto Parts",
    slug: "throssel-daily-scriptures-alto-parts",
    resource_kind: "Choir parts",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=1aEeErERwRj-4MsSIb07RGA28otiwNcAU",
    summary: "MP3 harmony recordings for the alto parts of the daily scriptures.",
    body: download_intro
  },
  {
    title: "Daily Scriptures: Tenor Parts",
    slug: "throssel-daily-scriptures-tenor-parts",
    resource_kind: "Choir parts",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=1zE85mGLleVyY6BR_Wh7G7ALz8V68Cp04",
    summary: "MP3 harmony recordings for the tenor parts of the daily scriptures.",
    body: download_intro
  },
  {
    title: "Daily Scriptures: Bass Parts",
    slug: "throssel-daily-scriptures-bass-parts",
    resource_kind: "Choir parts",
    resource_format: "Audio ZIP",
    resource_url: "https://drive.google.com/uc?export=download&id=1NVpxY3iZArbUD8_gXhzZJSobaFHJYLXQ",
    summary: "MP3 harmony recordings for the bass parts of the daily scriptures.",
    body: download_intro
  }
]

scripture_pdfs = [
  ["Sandokai", "sandokai", "https://throssel.org.uk/wp-content/uploads/2020/11/02a4sandokai.pdf"],
  ["The Most Excellent Mirror-Samadhi", "most-excellent-mirror-samadhi", "https://throssel.org.uk/wp-content/uploads/2025/08/Most-Excellent-M_OBC_2023.pdf"],
  ["Ancestral Line", "ancestral-line", "https://throssel.org.uk/wp-content/uploads/2020/11/07a4ancestralline.pdf"],
  ["The Scripture of Avalokiteshwara Bodhisattva", "scripture-of-avalokiteshwara-bodhisattva", "https://throssel.org.uk/wp-content/uploads/2025/08/Avalokiteshwara-Scr._OBC_2019.pdf"],
  ["The Scripture of Great Wisdom", "scripture-of-great-wisdom", "https://throssel.org.uk/wp-content/uploads/2025/08/SGW-obc2023ver.pdf"],
  ["The Litany of the Great Compassionate One", "litany-of-the-great-compassionate-one", "https://throssel.org.uk/wp-content/uploads/2025/08/Litany-Grt-Comp_obc_2023.pdf"],
  ["Adoration of the Buddha's Relics", "adoration-of-the-buddhas-relics", "https://throssel.org.uk/wp-content/uploads/2020/11/06a4adorbdsrelics.pdf"],
  ["Rules for Meditation", "rules-for-meditation", "https://throssel.org.uk/wp-content/uploads/2020/11/09a4rulesformed.pdf"],
  ["Vespers", "vespers", "https://throssel.org.uk/wp-content/uploads/2025/08/Vespers-obc2023ver.pdf"]
]

scripture_audio = [
  ["Dawn Drum and Kesa Verse", "dawn-drum-and-kesa-verse", "https://throssel.org.uk/wp-content/uploads/01dawndrum.mp3"],
  ["Sandokai", "sandokai", "https://throssel.org.uk/wp-content/uploads/02sandokai.mp3"],
  ["The Most Excellent Mirror-Samadhi", "most-excellent-mirror-samadhi", "https://throssel.org.uk/wp-content/uploads/03mostexce.mp3"],
  ["Ancestral Line", "ancestral-line", "https://throssel.org.uk/wp-content/uploads/04ancestra.mp3"],
  ["The Scripture of Avalokiteshwara Bodhisattva", "scripture-of-avalokiteshwara-bodhisattva", "https://throssel.org.uk/wp-content/uploads/05avalokit.mp3"],
  ["The Scripture of Great Wisdom", "scripture-of-great-wisdom", "https://throssel.org.uk/wp-content/uploads/06greatwis.mp3"],
  ["The Litany of the Great Compassionate One", "litany-of-the-great-compassionate-one", "https://throssel.org.uk/wp-content/uploads/07litanyof.mp3"],
  ["Adoration of the Buddha's Relics", "adoration-of-the-buddhas-relics", "https://throssel.org.uk/wp-content/uploads/08adoratio.mp3"],
  ["Vandana and Ti-Sarana", "vandana-and-ti-sarana", "https://throssel.org.uk/wp-content/uploads/09vandana.mp3"],
  ["Pancha Sila", "pancha-sila", "https://throssel.org.uk/wp-content/uploads/10pancasil.mp3"],
  ["Rules for Meditation", "rules-for-meditation", "https://throssel.org.uk/wp-content/uploads/11rulesfor.mp3"],
  ["Vespers", "vespers", "https://throssel.org.uk/wp-content/uploads/2021/03/12vespers2021.mp3"]
]

backing_tracks = [
  ["Short Morning Service", "short-morning-service", "https://throssel.org.uk/wp-content/uploads/2025/10/Short-Morning-Service-vox.mp3"],
  ["Vespers", "vespers", "https://throssel.org.uk/wp-content/uploads/2025/10/Vespers-vox.mp3"]
]

scripture_pdfs.each do |title, slug, url|
  downloads << {
    title: "Daily Scriptures PDF: #{title}",
    slug: "throssel-daily-scriptures-pdf-#{slug}",
    resource_kind: "Scripture",
    resource_format: "PDF",
    resource_url: url,
    summary: "A4 landscape PDF for printing and practice use.",
    body: download_intro
  }
end

scripture_audio.each do |title, slug, url|
  downloads << {
    title: "Daily Scriptures Audio: #{title}",
    slug: "throssel-daily-scriptures-audio-#{slug}",
    resource_kind: "Scripture",
    resource_format: "MP3",
    resource_url: url,
    summary: "Audio recording for learning or following the daily scriptures.",
    body: download_intro
  }
end

backing_tracks.each do |title, slug, url|
  downloads << {
    title: "Daily Ceremonies Backing Track: #{title}",
    slug: "throssel-daily-ceremonies-backing-track-#{slug}",
    resource_kind: "Backing track",
    resource_format: "MP3",
    resource_url: url,
    summary: "MP3 backing track for use with daily ceremonies.",
    body: download_intro
  }
end

downloads.each_with_index do |attributes, index|
  Literature.find_or_initialize_by(slug: attributes[:slug]).tap do |literature|
    literature.assign_attributes(
      {
        tradition: "Throssel",
        source_note: "Download listed by Throssel Hole Buddhist Abbey.",
        attribution: throssel_attribution,
        position: scripts.size + index + 1
      }.merge(attributes)
    )
    literature.save!
  end
end

source_intro = "Open the local copy when available, then use this page for questions, notes, and practice discussion."

shasta_attribution = "Source: Shasta Abbey Buddhist Monastery publications page. Shasta states its Press publications, with noted exceptions, are offered in the spirit of dana for free distribution when unchanged."

shasta_downloads = [
  ["Serene Reflection Meditation", "serene-reflection-meditation", "Book", "PDF", "https://shastaabbey.org/pdf/SRM.pdf", "An introductory Shasta Abbey Press book on Serene Reflection Meditation practice."],
  ["Roar of the Tigress, Volume One", "roar-of-the-tigress-volume-one", "Book", "PDF", "http://www.shastaabbey.org/pdf/bookRoar1.pdf", "First volume of teachings edited with an introduction by Rev. Daizui MacPhillamy."],
  ["Buddhism from Within", "buddhism-from-within", "Book", "PDF", "https://shastaabbey.org/pdf/BuddhismFromWithin.pdf", "Rev. Daizui MacPhillamy's intuitive introduction to Buddhism and Buddhist practice."],
  ["Zen is Eternal Life", "zen-is-eternal-life", "Book", "PDF", "http://www.shastaabbey.org/pdf/bookZel.pdf", "Rev. Master P.T.N.H. Jiyu-Kennett's book on Zen training and practice."],
  ["The Wild, White Goose", "wild-white-goose", "Book", "PDF", "https://shastaabbey.org/wp-content/uploads/2022/06/Wild-White-Goose-Lulu.pdf", "Rev. Master Jiyu-Kennett's diary of a female Zen priest."],
  ["Soto Zen", "soto-zen", "Book", "PDF", "http://www.shastaabbey.org/pdf/bookSotoZen.pdf", "An introduction to the thought of the Serene Reflection Meditation school of Buddhism."],
  ["Roar of the Tigress, Volume Two", "roar-of-the-tigress-volume-two", "Book", "PDF", "http://www.shastaabbey.org/pdf/bookRoar2.pdf", "Second volume of teachings edited with an introduction by Rev. Daizui MacPhillamy."],
  ["Denkoroku: Front Matter", "denkoroku-front-matter", "Book section", "PDF", "https://shastaabbey.org/pdf/bookDenk00.pdf", "Opening pages of The Record of the Transmission of the Light."],
  ["Denkoroku: Introduction", "denkoroku-introduction", "Book section", "PDF", "https://shastaabbey.org/pdf/bookDenk01.pdf", "Introductory section of The Record of the Transmission of the Light."],
  ["Denkoroku: Pages 1-98", "denkoroku-pages-1-98", "Book section", "PDF", "https://shastaabbey.org/pdf/bookDenk02.pdf", "First main section of The Record of the Transmission of the Light."],
  ["Denkoroku: Pages 99-225", "denkoroku-pages-99-225", "Book section", "PDF", "https://shastaabbey.org/pdf/bookDenk03.pdf", "Middle section of The Record of the Transmission of the Light."],
  ["Denkoroku: Pages 226-308", "denkoroku-pages-226-308", "Book section", "PDF", "https://shastaabbey.org/pdf/bookDenk04.pdf", "Final section of The Record of the Transmission of the Light."],
  ["Shobogenzo", "shobogenzo", "Book", "PDF", "http://www.shastaabbey.org/pdf/shoboAll.pdf", "Complete Shobogenzo PDF translated by Rev. Master Hubert Nearman."],
  ["How to Grow a Lotus Blossom", "how-to-grow-a-lotus-blossom", "Book", "PDF", "https://shastaabbey.org/wp-content/uploads/2022/06/Lotus-Blossom-POD-3rd-pr-compressed_1.pdf", "Rev. Master Jiyu-Kennett's book on how a Zen Buddhist prepares for death."],
  ["Buddhist Writings on Meditation and Daily Practice", "buddhist-writings-on-meditation-and-daily-practice", "Book", "Ebook", "https://shastaabbey.org/wp-content/uploads/2022/06/Buddhist-Writings-scan.pdf", "A collection from the Serene Reflection Meditation tradition translated by Rev. Hubert Nearman."],
  ["An Introduction to the Tradition of Serene Reflection Meditation", "introduction-to-the-tradition-of-serene-reflection-meditation", "Booklet", "PDF", "http://www.shastaabbey.org/pdf/IntroSRM13.pdf", "A booklet introducing fundamental teachings and practice of the Serene Reflection Meditation tradition."],
  ["Book of Daily Ceremonies", "book-of-daily-ceremonies", "Booklet", "PDF", "https://shastaabbey.org/wp-content/uploads/2025/02/Book-of-Ceremonies-8-24-24.pdf", "Shasta Abbey's daily ceremonies booklet."]
]

obc_attribution = "Source: Order of Buddhist Contemplatives Dharma pages. Linked here for access and discussion; article text remains with the original publisher."

obc_resources = [
  ["OBC Teachings", "teachings", "Index", "Web page", "https://obcon.org/dharma/", "The main OBC Dharma page collecting written and spoken teachings."],
  ["Revised Daily Office Scriptures: Printable Booklet", "revised-daily-office-scriptures-printable-booklet", "Scripture booklet", "PDF", "https://obcon.org/wp-content/uploads/2025/05/OBC_Daily_Ceremonial_update_NA.pdf", "Printable booklet for the revised daily office scriptures."],
  ["Revised Daily Office Scriptures: Electronic Version", "revised-daily-office-scriptures-electronic-version", "Scripture booklet", "PDF", "https://obcon.org/wp-content/uploads/2025/05/OBC_Daily_Ceremonial_update_NA_e.pdf", "Electronic version of the revised daily office scriptures."],
  ["Essays on Practice", "essays-on-practice", "Essay index", "Web page", "https://obcon.org/dharma/essays-on-practice/", "OBC page introducing selected practice essays and the Journal."],
  ["Perfect Faith", "perfect-faith", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/perfect-faith/", "OBC Dharma essay on practice and faith."],
  ["The Truth of Being", "truth-of-being", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/on-being/", "Essay by Rev. Haryo Young, M.O.B.C."],
  ["Why Monasticism", "why-monasticism", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/why-monasticism/", "OBC Dharma essay on the place of monastic training."],
  ["The Vessel and Its Contents", "vessel-and-its-contents", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/the-vessel-and-its-contents/", "OBC Dharma essay on practice."],
  ["Continuing Practice After a Retreat", "continuing-practice-after-a-retreat", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/continuing-practice/", "Essay by Paul Taylor, OBC, on carrying practice beyond retreat."],
  ["The Great Wish", "great-wish", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/the-great-wish/", "OBC Dharma essay on practice aspiration."],
  ["Serene Reflection", "serene-reflection", "Essay", "Web page", "https://obcon.org/dharma/essays-on-practice/serene-reflection/", "OBC Dharma essay related to Serene Reflection practice."],
  ["Buddhism", "buddhism", "Teaching", "Web page", "https://obcon.org/dharma/buddhism/", "OBC page introducing Buddhism and related study resources."],
  ["The Eightfold Path", "eightfold-path", "Teaching", "Web page", "https://obcon.org/dharma/buddhism/the-eightfold-path/", "OBC teaching page on the Eightfold Path."],
  ["Shushogi", "shushogi", "Teaching", "Web page", "https://obcon.org/dharma/buddhism/shushogi/", "OBC teaching page for Shushogi."],
  ["Meditation", "meditation", "Teaching", "Web page", "https://obcon.org/dharma/meditation/", "OBC teaching page on meditation practice."],
  ["Buddhist Precepts", "buddhist-precepts", "Teaching", "Web page", "https://obcon.org/dharma/buddhist-precepts/", "OBC page outlining the Buddhist Precepts in Serene Reflection Meditation."],
  ["Glossary of Buddhist Terms", "glossary-of-buddhist-terms", "Reference", "Web page", "https://obcon.org/dharma/glossary-of-buddhist-terms/", "OBC glossary of Buddhist terms."],
  ["Audio Dharma Talks", "audio-dharma-talks", "Audio index", "Web page", "https://obcon.org/dharma/audio-dharma-talks-2/", "OBC page linking to audio Dharma talks."]
]

shasta_downloads.each_with_index do |(title, slug, kind, format, url, summary), index|
  Literature.find_or_initialize_by(slug: "shasta-#{slug}").tap do |literature|
    literature.assign_attributes(
      title: title,
      tradition: "Shasta Abbey",
      summary: summary,
      body: source_intro,
      source_note: "Publication listed by Shasta Abbey Buddhist Monastery.",
      resource_url: url,
      local_resource_path: "/resources/shasta/#{slug}.pdf",
      resource_kind: kind,
      resource_format: format,
      attribution: shasta_attribution,
      position: scripts.size + downloads.size + index + 1
    )
    literature.save!
  end
end

obc_resources.each_with_index do |(title, slug, kind, format, url, summary), index|
  Literature.find_or_initialize_by(slug: "obc-#{slug}").tap do |literature|
    literature.assign_attributes(
      title: title,
      tradition: "OBC",
      summary: summary,
      body: source_intro,
      source_note: "Resource listed by the Order of Buddhist Contemplatives.",
      resource_url: url,
      resource_kind: kind,
      resource_format: format,
      attribution: obc_attribution,
      position: scripts.size + downloads.size + shasta_downloads.size + index + 1
    )
    literature.save!
  end
end
