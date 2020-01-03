Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.1363.1578094558196304450
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jan 2020 15:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=EVnAB+Eu;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.67, mailfrom: troth@openavr.org)
Received: by mail-wr1-f67.google.com with SMTP id g17so43824175wro.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 03 Jan 2020 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rx3/+XOhurWs117/5BLcC8+e2ljZZ4AAC22+JCdNrfk=;
        b=EVnAB+EuUogrAvCQy+NI7NkUk3iiOqOi0oeG61G5Ryc86zUfKv2XkAVML4VS8/FFTo
         n+zAfoJgGZkaKxk0ZpcwzHL0fjOHz9fWYmTjXIurWn0BYdr2a2iuuLHGT5TB8NuJoXof
         LZvUojcJ8I7MLcGPZxLnRzu5Xh6dYaUW9E78TH2xad79VXIoy8pZLvYErmDqi5+oI9MV
         3/v5C/VnypqGCSrPMVeuLP7xrVOGwwaaV6z+f/C3vHC6qeqckFc6fbCatDtt9XJD1LCn
         iyA9321Q02fSAR+R58QJrV8f03H1x4kFgpc5TMjXfU9fkPUORpGZMgJkte525ixpDSu5
         2GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rx3/+XOhurWs117/5BLcC8+e2ljZZ4AAC22+JCdNrfk=;
        b=FqjW/TupaABINduTFnRuMLy7si/jne0yD2n+5HkLSxWViy/pYuNe2fz1iQCp0zSnTd
         cIekt2vczm3nq4dQMCU3DPsasDfFAw89lXLyntk12Oiszx0L5uYv9Vw6EMP2DqBot835
         fw/0O8XUB9i5ta+FqftQlDRYR0mwfueLtrWHnylJv/inTNobEYFAes8F0nfRmR2wTnJC
         XssCI+vtPAzmTJ223LxjaDiI7neAdlN84o0gL6iDrnjbZf0OyrDGC4Uy19U7kHkDZa+S
         Yz7c2QxHjc22xFLTGiJyXlz0cFV1BFaqFwmNxo1TNx72Fe+kIR2996DAt0mHAmL9F5A+
         ZgJw==
X-Gm-Message-State: APjAAAV5ZEe5+YqAn43HcKSP/WwJEqFsXWMSUQzSFQM8yw9yi/CoptBd
	K4i9yBkByPeIEmtkTA9YwZS4nDwPN5hoj2QOBp6jOg==
X-Google-Smtp-Source: APXvYqzMBxaE8b2EnYg3cvuXW4IqgKAw/VHQ+3DzCdmkcslisn8RdyFkM9gBlm7ZcWfWk5DyFh1xUu+PVH0Pd1KwcKI=
X-Received: by 2002:adf:ee82:: with SMTP id b2mr59399259wro.194.1578094556621;
 Fri, 03 Jan 2020 15:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20200102194059.GA13220@beast> <d626ca1c-6e7f-0412-5a6c-8021a9eb8237@ti.com>
In-Reply-To: <d626ca1c-6e7f-0412-5a6c-8021a9eb8237@ti.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Fri, 3 Jan 2020 16:35:45 -0700
Message-ID: <CAFMvBt2hut8kkGo4O3NAecQ5Vs=hSLQ5GRJDTk144OnsL-uxLw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] beagle-x15: add am5729-beagleboneai.dtb
To: "Andrew F. Davis" <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 3, 2020 at 2:30 PM Andrew F. Davis <afd@ti.com> wrote:
>
> On 1/2/20 2:40 PM, Theodore A. Roth wrote:
> > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > ---
> >  conf/machine/beagle-x15.conf | 5 ++++-
>
>
> Why add this to the X15 machine? The Beagebone AI is not an X15, the
> catch all for AM57xx machines seems to be am57xx-evm.conf, which already
> has the am5729-beagleboneai.dtb.

I tried building an image using the am57xx-evm.conf machine in the first place,
but it didn't build the wic image, so I added it to the X15 (since they have the
same processor). The X15 machine seemed a good place to put it due to the
similarities. Seemed similar to what is going on in the beaglebone.conf machine
file (lots of very different boards handled in a single machine file).

>
> Thinking more about this, the defining features of the AI might warrant
> a new machine conf.

I'm not opposed to adding a new beagle-ai.conf machine. Looking at
the X15 machine conf, it seems that there would not be much different
for the BBAI other than possibly MACHINE_GUI_CLASS and SERIAL_CONSOLES.

Any ideas or hints on what would be different in the machine conf for BBAI
versus the X15?

I'm also not sure why beagle-x15.conf has UBIFS stuff it it since that board has
an eMMC nand flash device on it.

Thanks for the feedback.

Ted Roth

>
> Andrew
>
>
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
> > index d5e05ec7..0af45a84 100644
> > --- a/conf/machine/beagle-x15.conf
> > +++ b/conf/machine/beagle-x15.conf
> > @@ -4,7 +4,10 @@
> >
> >  require conf/machine/include/dra7xx.inc
> >
> > -KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
> > +KERNEL_DEVICETREE = " \
> > +    am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
> > +    am5729-beagleboneai.dtb \
> > +"
> >
> >  MACHINE_GUI_CLASS = "bigscreen"
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#12591): https://lists.yoctoproject.org/g/meta-ti/message/12591
> > Mute This Topic: https://lists.yoctoproject.org/mt/69386296/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [afd@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
