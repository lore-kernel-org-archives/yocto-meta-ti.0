Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.5285.1616046240019083192
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 22:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vB+QEkRO;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id g185so918155qkf.6
        for <meta-ti@lists.yoctoproject.org>; Wed, 17 Mar 2021 22:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eYwVfNFtDFcY82ROEwXkaJwyrAtA0NSIt43+CQR830s=;
        b=vB+QEkROEXE4fcbwGLyo8IkK/gBPwX6S968reTFfWyeDdzzs/axlQN2BeXlIhZFGMf
         ckyJ9v4bstD6IhE3zk77DVatP2wJGjh9kf4NZ2mhKQaNUGZMYGIoqFoWwfam9fEQbGuH
         ewLOvrFJqEAfbLUKV5ITsGMNQFjEdnkylDmgIyxrPXPaASyxTk1qAb+/ItsSfoh7PI8R
         8Hs2FFiHEKA/iu2SNzJ6kVwM3VarIeI/4GqBidlIZpF1lCk+0gaUa+qGT5shIA4+LEj+
         D3MS/4r2+eruO1L6L+M2nCdyPJ1CeYDHukhzhjGcvlLn+c8tYHneSTfoKmF8EoyuFB4X
         Y6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eYwVfNFtDFcY82ROEwXkaJwyrAtA0NSIt43+CQR830s=;
        b=bNf0HQkd/zJ/8X04FvX2nJtkLwQ3KWAN4hSpkyv53PUkKJvKGKB7hU84MeOReJY2+J
         bWWs7/u9xOgawKjV4aeZ2inHWraID+Mqt8LX+uEKkRGaqjEfqU8zzFjES4Exu3iy+0S5
         Y+iNmeZmlYIqrAQcN7rqSKZ4mrF4pqZaYPbucotMB8F0Jpw8yvqmsg1dxzGcXGzgkQOo
         fJ2hejIjbZxGFKl9831j1s8QHgskk2b91U/Exzt1clvKckZLP6rEwtqLjdSxqjQUX7tx
         HSa2KUBkIhQtsmicxp2rs2eHQQAtFeQIaYLXpe+P+MmZEXI7XbKnsvJ1kvnaqtBl/tYH
         ving==
X-Gm-Message-State: AOAM531lLNVDs5GLAVmmT8bk1xH3PsEEW4kYwNv2g1d0MKQNbQDVYF2R
	0MUDKfh4b6gulXSRk9cBu7KQcBMeinoASeYZr1n8I86GN04/jg==
X-Google-Smtp-Source: ABdhPJyLbyEkkFsFY2FCY+SGN+lSvlkEqzzBrWPhE7472Zc5fFF7zhLyf2R41D353mCr934POgx+QkNXbitM0p1ka7Y=
X-Received: by 2002:a37:a350:: with SMTP id m77mr2787458qke.146.1616046238926;
 Wed, 17 Mar 2021 22:43:58 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 22:43:33 -0700
Message-ID: <CAMKF1soh-om+Qwh8J4YNpCa4Hv+SUgwUcRzHGvxcrBYyPB0Row@mail.gmail.com>
Subject: uim-sysfs duplicate recipes
To: meta-ti@lists.yoctoproject.org, Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi

uim-sysfs seems to be copied into several layers as seen here

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=uim-sysfs

I wonder if this should be consolidated into one common place ?
perhaps meta-oe or somesuch
layer.

If not, which one should be used when both meta-ti and meta-96boards
layers are used in
a distro ?

Thanks
-Khem
