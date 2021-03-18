Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.5314.1616046957737001114
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 22:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ISpyiJJh;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id o19so2696759qvu.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 17 Mar 2021 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=xMwi3M17Hp73kaua3sGyGlHleerShkYfc21cWLvMCrk=;
        b=ISpyiJJhEmP0P5LZ0OdjrtYeU8SM5l5/+DbtdU9fGlXnLq9/kSR4UL6Vc8JBt3VU/a
         5HwrOtz3scGwCFCk57t/ScEXx8Kfo4BBLd9FCFreGfvzMS1zNDL0kMZgsE/d3RV0FsfH
         YDB+h7SomwkYTyEC3jq2C77guQ5sJA2sbYPRHXuCPy9uBuQW1C+v5TcC8/1LBNBM52hf
         zyyqWvXzUrRQrtdWYtwrx+EnQlChWDzAjB2WU8gsMPvvTYHfEofic44E0oawfzPxo4uI
         4n5i3sYzv7iqJLzLnJ1NMMsa3Lu36AlUUeaqXmFXHW3PoYI+RgzQo4LZr3qmzVSe6SOU
         j9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xMwi3M17Hp73kaua3sGyGlHleerShkYfc21cWLvMCrk=;
        b=gfccFi+jdmmVn455pZtaL9a07RVP58YjtwQT1o/bie4IvAOaSJ87HRxTXswv8efFkd
         7OCtpVk3qgV6XcccfGfulJG4299uL2ubW4MmNzYrTwG4gJsXWMY+A2U/wLgAuduttnkn
         JhDyvWuNsUmkevdSNB9wOGUCX8QBOt1h+LeE+Hjtni8W5WO+GSXaE4npiNH5xlgbjujI
         CiKqRjicAFuWvDWn857JMDR8vz5qiEQ9XAb0LixUZtwLYFncEXREv6GoY1KtiaXF2w7B
         yr66uF//yewL+0T4rZ5tOEdg9aN+LbfKwTHCIDfwi43m0ikpCkQVnjyp7/XmiqQgfEZp
         zZeg==
X-Gm-Message-State: AOAM532+KJZYCm2suT2os12IRySVhLje+UWPEFTzlYhKwWS1dhIwGlMK
	pRVsBRoUqLq6E4t3rlpXP3AAt9jW+04MzZNKLCreJd9QVqlskA==
X-Google-Smtp-Source: ABdhPJyFO85KBjCU5F5uRfASGa2N5aL/WqCWqI5znucmwuyuH0MGRypVsdB7W8lpsVPXni2xzaS3z/nO0qWSomr4xGM=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr2796908qvb.55.1616046956473;
 Wed, 17 Mar 2021 22:55:56 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 22:55:30 -0700
Message-ID: <CAMKF1som3yQ-6B7yzvdv-hHCyJF9h1VxnUoY0oTLpLfMdjYuKg@mail.gmail.com>
Subject: doxygen recipe duplicate in meta-ti
To: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I am seeing this

doxygen:
  meta-oe              1.8.20
  meta-ti              1.8.9.1

And meta-ti wins because it has higher layer priority, which is not a good thing
can we use the version from meta-oe and delete it from meta-ti ?

Thanks
-Khem
