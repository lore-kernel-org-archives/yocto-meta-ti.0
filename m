Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.2005.1615510740554770358
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 16:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dNXiYZIF;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: robertcnelson@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id bf3so5625904edb.6
        for <meta-ti@lists.yoctoproject.org>; Thu, 11 Mar 2021 16:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tvNMnt7I6BxNX8ElWHl5NgRvIm7phEELZ2y37rg22mU=;
        b=dNXiYZIFrytG0/tItG03IX1eYqYxR315VVghV6c0mh+WHDHYQ5fUJxl2rABJRhc2qA
         LH2LCPgzMvIpJFqUCm0MeY4NlKWTAaqR1xLaD5CxyQqwuGFdgRXiS6zQtCpT2+4AI/Em
         CXaC+eyfxkRmURcN2NxKWQXUiTwyU01fwIdtkCAceykrHvny8igUxauuj/ulMbLUD40F
         Ii6py6VoIL05T/JR27NM7J2f8LHz/9QnN6jnvBLhQe5XaOLqmOLgzSkLR2PiJzv9cGp6
         6LaXRpRyvP3AgwHOSLn3dbX4ehjC3Fa5SyB1EeqeI2Nf6XVs6wRUrwl1H2Tb2hRnmh6F
         6tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tvNMnt7I6BxNX8ElWHl5NgRvIm7phEELZ2y37rg22mU=;
        b=d07VUdSjOGQ0zhoz3/fBTg01qKcxN5vFLh6/i7riENs78A+8rUJrMWJMHFMD8k0Kjp
         yrA+o4z7HHTlMWtBj+hbS7LorkLBsz3rtwbqwyfgga/nLWhoDqIymrizFaqYmQhKoCbr
         ol16tNdH+0c6vHHRPSE6OsadoICfL8sgQFpFThP9ZTD/ayprA/8MlTQkfb5sqRZp77Hp
         AwuGYhugEZienTvhCLD7Ppmtod7zCqVIVNsIom0AToaCUDCjtLoZR+H/J0uKlsju7r48
         it5702FLEJEXheUV0puZbntuCTOxl1ckLu7tDk7bY7vhmJG7cqsRLiKr89NT7V8izp8T
         eHbg==
X-Gm-Message-State: AOAM5334+asKB0rcGvhstiqKGVcJ9emwCU13aKSSQr5eSUZqP5Fy7zUk
	2R9AvYlohwFrpUToXqaDwUg4lyangn8OeA8teqA=
X-Google-Smtp-Source: ABdhPJwut5JtZI155yU0ITy3v59XEDX5eHJtabmAaFlCmMGV40SUyTKft6yrQMPdWvb/GGdczvIaekr6E70izmUj+00=
X-Received: by 2002:aa7:c0c7:: with SMTP id j7mr11298883edp.298.1615510738994;
 Thu, 11 Mar 2021 16:58:58 -0800 (PST)
MIME-Version: 1.0
References: <15557.1615501082424309597@lists.yoctoproject.org> <24755.1615501174442330946@lists.yoctoproject.org>
In-Reply-To: <24755.1615501174442330946@lists.yoctoproject.org>
From: "Robert Nelson" <robertcnelson@gmail.com>
Date: Thu, 11 Mar 2021 18:57:27 -0600
Message-ID: <CAOCHtYjagGkpX0EkZXDr_PrL4DHqkdYkXdhzraG1=+b+5xOASA@mail.gmail.com>
Subject: Re: [meta-ti] Beaglebone Black Ethernet Failures
To: Dave Tucker <theaethereal@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 4:19 PM Dave Tucker <theaethereal@gmail.com> wrote:
>
> Actually, looking back at it, this was a commit, not a patch.  So yes, it is in the u-boot code already.  But it's failing to perform somehow.

For the am335x target, u-boot supports two path's, legacy "board" path
and newer "device tree" path.. That fixup only applies if your build
of u-boot uses the new "device tree" path..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
