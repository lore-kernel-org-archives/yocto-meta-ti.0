Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.57.1581546006895304113
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 14:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KcdLk4+C;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id w25so3770758qki.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2020 14:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PdJXSmDWQm62pNF8lrSz2jWTqwswSV0feyzdPkwh24=;
        b=KcdLk4+CJHOTvJXizQKHgDwBvaOtT7yksiFXxNCtiCsvmixGlg3xouR8XgSF/Ce0/n
         A/L7zaA+aDUUEEKVw5Ghtzrz5DGR1ycAPZ2XubOyp8NhjrH2hQ+FMHUYbcb0MLwy/pEG
         YhLNvGuLqcJXETFjP63UV6r2ovfIWRsC8n0AZJ2d+hwJvk9DAFNrau3o94Fi0YuTXbzY
         YaTheEHF1v9bqrztzcEf6gibb383cVxp+Xhhn/TeZYDYqxz82XPBt0a9XX+1GlW5nIkM
         zzMFkO/XbYXU5YwnX91141ZSi0oU0nAbXyunUmieURETiIKxO1gCNXy8y2wlzxEh/Se2
         MxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PdJXSmDWQm62pNF8lrSz2jWTqwswSV0feyzdPkwh24=;
        b=tEDTMASItjug/TqXnOhJcgE0PZ5tmpOdwCsh9jXFsn9a2maooqS5YKJW4X8gE3SQKa
         wEbkPqT5zd2MESgx1fQAM+AU8je530Y+HjBvGWARB+0z7xe2HzMcUyzh5fw8xICAlWLJ
         60n6NsxGqiDbtFZuyEJB9J9b/Y7F97Xgv+vBaBaUJiu9SkLCLsghp72/FfFexXYUOPpU
         /i3RJ2CvISlPl1dqL712AxVrvy1VmdBkar03/uzqctXtWzBYXJl/wvnBKv9cHc25OkY6
         DSFDgkPuTefD0f5Eu/cXFSk3Gi6jZVj7RDUz7PjpqtGXJNCZOKiLp3FDlm/0MOhlBL7C
         ouCw==
X-Gm-Message-State: APjAAAUGMGdHezaqjLjmqiB/LMS2c7YuG374hGKfNR47+Y4EPKy0aujl
	hEcBwrOHAZT/XiNb4MornOFzxQdJ1oU9Fg3EJHw=
X-Google-Smtp-Source: APXvYqxvUAYXZsA7Isk+boAiYkJQx36YiinSboTNc5sxriBpnoWwFPnyrTPT1+J92TIRqsE3LGlemkR00txVpMVOdos=
X-Received: by 2002:a37:de05:: with SMTP id h5mr9863979qkj.474.1581546005820;
 Wed, 12 Feb 2020 14:20:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
 <20200212200811.GE30768@beryl>
In-Reply-To: <20200212200811.GE30768@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 Feb 2020 14:19:38 -0800
Message-ID: <CAMKF1sqGMyrWEx1phE5XuP2=7_uxeu6q7itMvhvBOvxYJP0Jaw@mail.gmail.com>
Subject: Re: ti-cgt6x bundling libc.a with unreadable ELF file header
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 12, 2020 at 12:08 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sun, Feb 09, 2020 at 10:26:44AM -0800, Khem Raj wrote:
> > Hi
> >
> > Recently, I am seeing below packaging error for ti-cgt6x
> >
> > https://errors.yoctoproject.org/Errors/Details/390526/
>
> Is this on master? Any specific configuration I should use to get this error?
> I don't think I've ever seen this before or lately...
>

yes this is on qemuarm though, I find that it will be better to
disable it for non-ti socs

>
> > eu-readelf also fails to read this file as well as binutils readelf
> > also complains
> >
> > readelf: Error:
> > /mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINFO):
> > Failed to read file header
> >
> > this libc.a is a binary blob so I cant find out how it is. built so
> > pinpoint where the problem
> > could be.
> >
> > since these are DSP blobs should this be ignored from processing and
> > just dumped into rootfs
> > this will help packager turn a blind eye towards its contents or
> > should this be fixed and turned into
> > a readable ELF file by normal binutils. I doubt it being a problem
> > with tools, since I see same issue
> > with elfutils tools as well as binutils ELF manipulation tools.
> >
> > Thanks
> > -Khem
