Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web09.4043.1617075129498705039
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 20:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iEW1EYzQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: tagliapietra.alessandro@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 8so15874566ybc.13
        for <meta-ti@lists.yoctoproject.org>; Mon, 29 Mar 2021 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jboaX9IAq/jvFwEswTO73oWRhNHqLue3JE1qFumK0pA=;
        b=iEW1EYzQZlvYsBLyFA55NJvPUoVV/tHl7rmZg0/1pxUHII8sb8rlrH459JmRELR3FV
         8uXTuO61AKVMG36OsIqG/BMl36Jo3qwk+QeUqmx5Ze1jompuSGQ8efhr9HzKc0ilurDe
         Smlt9nNE31C53CXu9JCXigTgoq9RMTuMr4PFYR9eyF96IBSk+5j8Oxr63AmdwaiEvfCH
         GbH0LzrVHdVSbc6lE3VPSGk1m0J3a3RGTU4ShrAjOnaXq2jra74gKZbkg99LuwlRoHBL
         nA04pd2qF2HnlH6Zvv0GSpgweVHjFfBGj5I/S5zUpxlNxZIMO0R9nymq54KDSTrQpCk+
         AdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jboaX9IAq/jvFwEswTO73oWRhNHqLue3JE1qFumK0pA=;
        b=HLeZsotCZEhkrAyXt4YcQp8OYVG9kdVmdO4I/2MVGjcvNiV3VoW/2Vne8ncm2o5XTV
         O4CTz7Ub7YvK14qoxZjQibhoL/YeE5qwXPLHcWFIMJLqCLCoP4tVqiCI1n5yWHADY1z+
         ReUE1LHt0f5pUbEuswYkDFGQzOOBqxHG9zn7he4OMjQReCDUP1J6OQqBUi/RHK4WI/+q
         7jcdxYRBCtZ1ejnHD7Kt3FzIZ7ybcbzULYSs8qAHZMl4xGq4vNsWdn8D5YPVmD1FSJ5R
         Kp24AYBdHyq2FD8xULDVxnOPNECwD1IieAwF+HkqETdl3gXYvc/cESeDR82zz5QMJKQ+
         zc9A==
X-Gm-Message-State: AOAM532L6X+mpKAdDnQDbwIGM+9DotRl7DDJ6dJJNzr5AEOV1ARHDzJj
	Q0mPH6mAxmxkBsvRuwuvdDi+Oyc0rXeqB189S5U=
X-Google-Smtp-Source: ABdhPJzFzZt0gooRNljvJMUP44KKXAp4UoMRPG8W8f35A3tgrTFkvZY9Zt0SopczYru6ZOy1dCHqCJSj6jSTXvbYN1A=
X-Received: by 2002:a25:bfcd:: with SMTP id q13mr41835754ybm.298.1617075128624;
 Mon, 29 Mar 2021 20:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <28ma.1617003789931138360.Mb2u@lists.yoctoproject.org>
 <20210329184235.GC14886@denix.org> <4202bb3c-97b3-eb1d-d424-9c77a007b243@ti.com>
In-Reply-To: <4202bb3c-97b3-eb1d-d424-9c77a007b243@ti.com>
From: tagliapietra.alessandro@gmail.com
Date: Mon, 29 Mar 2021 20:31:57 -0700
Message-ID: <CAKKtPp9KWsA7H9XDGSMa8uqoEcUN7eA0=OD6J1Smif8-S6DMrQ@mail.gmail.com>
Subject: Re: [meta-ti] No serial output on a custom AM3352 board
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org, 
	"Bhargav, Krunal" <k-bhargav@ti.com>
Content-Type: multipart/alternative; boundary="0000000000009deb9605beb8a4c4"

--0000000000009deb9605beb8a4c4
Content-Type: text/plain; charset="UTF-8"

I did post it there but it seems out of scope for the forum.

https://e2e.ti.com/support/processors/f/processors-forum/989464/am3352-u-boot-not-showing-any-output-in-the-serial-console

--
Alessandro Tagliapietra



On Mon, Mar 29, 2021 at 6:20 PM Bajjuri, Praneeth <praneeth@ti.com> wrote:

>
>
> On 3/29/2021 1:42 PM, Denys Dmytriyenko wrote:
> > Just a follow up from our IRC discussion with more clarifications.
> >
> > * This is an industrial board/product from a 3rd-party manufacturer,
> based on
> > AM3352 SoC. It's custom enough, as obviously EVM images don't boot.
> >
> > * The manufacturer did not provide sources or instructions with the
> board,
> > only SD card binary images.
> >
> > * Boot log from those images indicate U-boot 2014.07 and kernel 3.14.43,
> which
> > are quite ancient
> >
> > Getting recent u-boot and kernel working on this board will require
> recreating
> > board configs and updating old DTS. Not sure mixing old u-boot with new
> kernel
> > is a good idea either - still need to massage DTS...
> >
> > Maybe our BSP experts here can pitch in and comment on feasibility of
> this
> > effort. It's definitely not Yocto specific though.
> >
> >
> > On Mon, Mar 29, 2021 at 12:43:09AM -0700,
> tagliapietra.alessandro@gmail.com wrote:
> >> Hello everyone,
> >>
> >> first time yocto user here, I'm trying to get a very minimal image to
> boot
> >> on a AM3352 based device that a local company made, however when it
> boots
> >> there is no output on the serial port.
> >>
> >> These are the steps I've tried:
> >> - added meta-ti and dependent layers
> >> - removed these features from the minimal image "alsa ext2
> api-documentation
> >> bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 vulkan" as I
> don't
> >> think are needed for our basic test
> >> - taken the dtb file from the manufacturer sd card, converted to dts
> using
> >> dtc, added to the kernel using a layer and changed KERNEL_DEVICETREE =
> >> "device-name-here.dtb"  (name replaced)
> >> - I've cloned their SD card to make sure the partitions are the same
> (FAT16
> >> first partition with boot flag + ext4 second partition)
> >> - bitbake build
> >> - replaced MLO/u-boot.img in the boot partition
> >> - extracted rootfs into the ext4 partition, copied zImage and the dtb
> files
> >> in the /boot folder
>
> The right place for this query is TI e2e . Please post your question
> there for someone to help.
>
> few related threads already in e2e addressing similar topic.
>
>
> https://e2e.ti.com/support/processors/f/processors-forum/852197/am3358-u-boot-fails
>
>
> https://e2e.ti.com/support/processors/f/processors-forum/945637/processor-sdk-am335x-how-to-boot-bone-black-over-uart
>
>
> https://e2e.ti.com/support/processors/f/processors-forum/927764/am3352-start-u-boot-from-usd
>
> Good luck
>
>
> >>
> >> I've also tried to use am335x-hs-evm as the machine (using also the UART
> >> variants of MLO and U-boot) but no luck.
> >> In case it's needed, these are the env variables from their working SD
> card
> >> u-boot
> >>
> >> https://gist.github.com/alex88/5e8d604ab15540b84353040a83bc0606
> >>
> >> What should I try to at least be able to get u-boot to output something
> in the console?
> >>
> >> Thank you in advance
> >
> >
> >
> > 
> >
>

--0000000000009deb9605beb8a4c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did post it there but it seems out of scope for the foru=
m.<div><br></div><div><a href=3D"https://e2e.ti.com/support/processors/f/pr=
ocessors-forum/989464/am3352-u-boot-not-showing-any-output-in-the-serial-co=
nsole">https://e2e.ti.com/support/processors/f/processors-forum/989464/am33=
52-u-boot-not-showing-any-output-in-the-serial-console</a></div><div><br cl=
ear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">--<div>Alessandro Tagliapietra</div>=
<div><br></div></div></div></div><br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 6:20 PM =
Bajjuri, Praneeth &lt;<a href=3D"mailto:praneeth@ti.com">praneeth@ti.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
<br>
On 3/29/2021 1:42 PM, Denys Dmytriyenko wrote:<br>
&gt; Just a follow up from our IRC discussion with more clarifications.<br=
>
&gt; <br>
&gt; * This is an industrial board/product from a 3rd-party manufacturer, =
based on<br>
&gt; AM3352 SoC. It&#39;s custom enough, as obviously EVM images don&#39;t=
 boot.<br>
&gt; <br>
&gt; * The manufacturer did not provide sources or instructions with the b=
oard,<br>
&gt; only SD card binary images.<br>
&gt; <br>
&gt; * Boot log from those images indicate U-boot 2014.07 and kernel 3.14.=
43, which<br>
&gt; are quite ancient<br>
&gt; <br>
&gt; Getting recent u-boot and kernel working on this board will require r=
ecreating<br>
&gt; board configs and updating old DTS. Not sure mixing old u-boot with n=
ew kernel<br>
&gt; is a good idea either - still need to massage DTS...<br>
&gt; <br>
&gt; Maybe our BSP experts here can pitch in and comment on feasibility of=
 this<br>
&gt; effort. It&#39;s definitely not Yocto specific though.<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Mar 29, 2021 at 12:43:09AM -0700, <a href=3D"mailto:tagliapie=
tra.alessandro@gmail.com" target=3D"_blank">tagliapietra.alessandro@gmail.c=
om</a> wrote:<br>
&gt;&gt; Hello everyone,<br>
&gt;&gt;<br>
&gt;&gt; first time yocto user here, I&#39;m trying to get a very minimal =
image to boot<br>
&gt;&gt; on a AM3352 based device that a local company made, however when =
it boots<br>
&gt;&gt; there is no output on the serial port.<br>
&gt;&gt;<br>
&gt;&gt; These are the steps I&#39;ve tried:<br>
&gt;&gt; - added meta-ti and dependent layers<br>
&gt;&gt; - removed these features from the minimal image &quot;alsa ext2 a=
pi-documentation<br>
&gt;&gt; bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 vulkan&qu=
ot; as I don&#39;t<br>
&gt;&gt; think are needed for our basic test<br>
&gt;&gt; - taken the dtb file from the manufacturer sd card, converted to =
dts using<br>
&gt;&gt; dtc, added to the kernel using a layer and changed=C2=A0KERNEL_DE=
VICETREE =3D<br>
&gt;&gt; &quot;device-name-here.dtb&quot;=C2=A0 (name replaced)<br>
&gt;&gt; - I&#39;ve cloned their SD card to make sure the partitions are t=
he same (FAT16<br>
&gt;&gt; first partition with boot flag + ext4 second partition)<br>
&gt;&gt; - bitbake build<br>
&gt;&gt; - replaced MLO/u-boot.img in the boot partition<br>
&gt;&gt; - extracted rootfs into the ext4 partition, copied zImage and the=
 dtb files<br>
&gt;&gt; in the /boot folder<br>
<br>
The right place for this query is TI e2e . Please post your question <br>
there for someone to help.<br>
<br>
few related threads already in e2e addressing similar topic.<br>
<br>
<a href=3D"https://e2e.ti.com/support/processors/f/processors-forum/852197=
/am3358-u-boot-fails" rel=3D"noreferrer" target=3D"_blank">https://e2e.ti.c=
om/support/processors/f/processors-forum/852197/am3358-u-boot-fails</a><br>
<br>
<a href=3D"https://e2e.ti.com/support/processors/f/processors-forum/945637=
/processor-sdk-am335x-how-to-boot-bone-black-over-uart" rel=3D"noreferrer" =
target=3D"_blank">https://e2e.ti.com/support/processors/f/processors-forum/=
945637/processor-sdk-am335x-how-to-boot-bone-black-over-uart</a><br>
<br>
<a href=3D"https://e2e.ti.com/support/processors/f/processors-forum/927764=
/am3352-start-u-boot-from-usd" rel=3D"noreferrer" target=3D"_blank">https:/=
/e2e.ti.com/support/processors/f/processors-forum/927764/am3352-start-u-boo=
t-from-usd</a><br>
<br>
Good luck<br>
<br>
<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve also tried to use am335x-hs-evm as the machine (using al=
so the UART<br>
&gt;&gt; variants of MLO and U-boot) but no luck.<br>
&gt;&gt; In case it&#39;s needed, these are the env variables from their w=
orking SD card<br>
&gt;&gt; u-boot<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://gist.github.com/alex88/5e8d604ab15540b84353040=
a83bc0606" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/ale=
x88/5e8d604ab15540b84353040a83bc0606</a><br>
&gt;&gt;<br>
&gt;&gt; What should I try to at least be able to get u-boot to output som=
ething in the console?<br>
&gt;&gt;<br>
&gt;&gt; Thank you in advance<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--0000000000009deb9605beb8a4c4--
