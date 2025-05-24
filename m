Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB271C54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 00:12:49 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.866.1748045559992136184
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 17:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1rme1uP;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: robertcnelson@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e09e8adc9so4503367b3.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 17:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748045559; x=1748650359; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHPOcbDjvMMy94URgBOTj0B8FBtUOUE14lnEcQfGZ2M=;
        b=U1rme1uP21NJkAlcYMEpNnlxjc5XqtffSGtBbF9B/KEjA/JSGJnORbenediHI3HWjX
         imoQwrlEXSffFVrdZhX+FkIQNJas5JUmNQcJw6+6VSzVc8vzaFQEyz1qZiRzkuzrCDwu
         0T5oGqJze1818V66Bnteo45G0bNesmRSsu2llqjc7sL9JtQFFnWyX4MV9QptG+g3U0K9
         tgxEmNO2oQ2bZrc6oAuTyWHo9KXo7+6ElplYqTOFZi3ZilaNfl3vP2uYViOOj4HpXOX/
         QhL5ghXhFVK4pkfkvjVV7nGh7xMFp8tSALbulhZgEM7T3hdTApJSStNHdDsc2LMsnNXu
         w62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748045559; x=1748650359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHPOcbDjvMMy94URgBOTj0B8FBtUOUE14lnEcQfGZ2M=;
        b=I/Ap6ND2qJlpHzfvRLyh2zdMCzRoo3EKm3MN/heeC9z9ubxXedYmudtDKbgpGFOtSH
         sRS7x8mI3Xl0qZmSH1Cth5HTjxEU1Xl9hN+lXFHtqOFnu5UHxwybwS8tr650Q2IfB3OX
         BYdSJ1cu2Dh19U7jNTC1mie9fX13IOy+GbD28szdte7DIkb2fYFxaFaKrjznW9khHeE8
         rH382InMN1x7E+nSwLYC0/oDmP42RFUFIufZR9FnG89GyL/0sSMC/b6k9nb2GfNti8Es
         zXjbehyn0MSgWJvp0sLbhd0DpcsIOkajWc5DLW0JwkRhZmt4nEEzoU84VLtlyB/RzZee
         VhnA==
X-Forwarded-Encrypted: i=1; AJvYcCW8JgxyiePghcekHVVs/iV9efiJj1XV4gemAqbaMqf6MriYbc3E/R8ZIiTsngjsPP9CwwNCO2pp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyLRqc8rT0tfnWrSiBBci2awzbNDSOy58jtpafIM4K7SLYFaNOr
	CulyyuQOZwqqyeB1V7jvA3AQYNALJ1sIL8Iluu04MnhYJRutn+vKmN9oZiqc6s25lhmtM6qiBoQ
	UobLMaOj9zaYDPwqFLKuIsuNgqPpdH1w=
X-Gm-Gg: ASbGncuwHB6ZDP6j2ezITLZhYLbEsd88GIZpWwdzizBirlKmRN+nWBL36PVezTxw0x3
	Z0zUFgIWcSn0vXShuE37W1qcdjWfCvFR9LIxPMZHxcIRgXnziVoDBwBs5EcZZHe/zn+bGEy6C9I
	qbKKU7xsUrXQjLEyAyK/THmkMAvVusEbQ/ig==
X-Google-Smtp-Source: AGHT+IGd7UZwlk+ZInY+JFNTtGB0K25FbE7P312vO3ANhv2mDj5xKFQ3MWerxbWfW4vx3qiQgwyW96LyohGrDmh2SD4=
X-Received: by 2002:a05:690c:6a0d:b0:70a:36b2:8f94 with SMTP id
 00721157ae682-70e2d997f53mr13370097b3.18.1748045559017; Fri, 23 May 2025
 17:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250517005430.3648211-1-denis@denix.org> <20250517005430.3648211-5-denis@denix.org>
 <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com> <20250519175202.GZ18383@denix.org>
 <CAOCHtYhAwQ=NXkgYzgTcCZnPjOzXcWPn3LBA6u4f1WAfGvbExg@mail.gmail.com>
 <CAOCHtYg2Vr0USbPbT9tryNw7-Qr0QjOHeYBsbPt=jtuE4-c3+g@mail.gmail.com> <20250523233839.GJ18383@denix.org>
In-Reply-To: <20250523233839.GJ18383@denix.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 23 May 2025 19:12:28 -0500
X-Gm-Features: AX0GCFtnIoHjRpX06FLkvhCmOL--pEf4vmMETHMgArUPhSYUlMaoJc8vrCpYvD0
Message-ID: <CAOCHtYhv5vi42v06LpwvrK2ybjrwXFmARwreo6=aq-5JuGewng@mail.gmail.com>
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI to 6.12
To: denis@denix.org
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000098ba350635d6927d"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 24 May 2025 00:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18599

--00000000000098ba350635d6927d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Send me a pm with your shipping address, I'll get one routed from work

On Fri, May 23, 2025, 6:38=E2=80=AFPM Denys Dmytriyenko via lists.yoctoproj=
ect.org
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:

> On Fri, May 23, 2025 at 05:32:14PM -0500, Robert Nelson wrote:
> > On Fri, May 23, 2025 at 5:30=E2=80=AFPM Robert Nelson <robertcnelson@gm=
ail.com>
> wrote:
> > >
> > > > > >@@ -10,3 +10,10 @@ UBOOT_GIT_URI =3D "git://
> github.com/beagleboard/u-boot.git"
> > > > > >  UBOOT_GIT_PROTOCOL =3D "https"
> > > > > >  BRANCH =3D "v2025.04-Beagle"
> > > > > >  SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> > > > > >+
> > > > > >+BRANCH:beagley-ai =3D "v2025.04-rc3-BeagleY-AI"
> > >
> > > Ugh... this was a build test of Andrew's patchset!
> > >
> > > > >
> > > > > BeagleY-AI support is now in the latest upstream master. This
> branch here
> > > > > is missing some updates for BeagleY-AI that can be found in maste=
r.
> > > > >
> > > > > Would it be better here to take the v2025.07-rc1-Beagle here whic=
h
> > > > > includes both these additional BeagleY-AI patches and also PB2
> support?
> > > > > Maybe it should be the default then.
> > > >
> > > > I'd be fine switching to 2025.07 eventually, once it matures a bit =
-
> I'm not
> > > > comfortable taking rc1 at this point.
> > > >
> > > > We can do this in stages - now update 6.1 -> 6.12 with 2025.04 in a
> seaprate
> > > > branch, then update 2025.04 -> 2025.07 when it's ready (either fina=
l
> or at
> > > > least rc3/rc4).
> > >
> > > https://github.com/beagleboard/u-boot/tree/v2025.07-rc2-Beagle
> >
> > I also tested on 2 BeaglePlay's and 2 BBAI-64's.. so i've moved
> > BeagleY-AI, BeaglePlay and BBAI-64 to v2025.07-rc2..
> >
> > I'll hack on PB2 over the weekend, that's going to take more of a
> > cleanup for am6232- -> am62 changes..
>
> Sounds good! I believe this series for meta-ti is ready to be merged, as
> it's
> been in different stages of testing for quite some time, plus the backlog
> of
> pending commits is quite long as it is now. After that we'll be able to d=
o
> a
> quick U-boot update to 2025.07 in a couple of weeks, once you push your
> branches and I do quick testing. Ah, and that means I'll need to get
> myself
> a new PB2 A1...
>
> --
> Denys
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18598):
> https://lists.yoctoproject.org/g/meta-ti/message/18598
> Mute This Topic: https://lists.yoctoproject.org/mt/113155503/3619810
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> robertcnelson@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000098ba350635d6927d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Send me a pm with your shipping address, I&#39;ll get one ro=
uted from work</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 23, 2025, 6:38=E2=80=AFPM Denys Dmytriyenko via=
 <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;d=
enis=3D<a href=3D"mailto:denix.org@lists.yoctoproject.org">denix.org@lists.=
yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Fri, May 23, 2025 at 05:32:14PM -0500, Robert Nelson wrote:<br>
&gt; On Fri, May 23, 2025 at 5:30=E2=80=AFPM Robert Nelson &lt;<a href=3D"m=
ailto:robertcnelson@gmail.com" target=3D"_blank" rel=3D"noreferrer">robertc=
nelson@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;@@ -10,3 +10,10 @@ UBOOT_GIT_URI =3D &quot;git://<a=
 href=3D"http://github.com/beagleboard/u-boot.git" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">github.com/beagleboard/u-boot.git</a>&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 UBOOT_GIT_PROTOCOL =3D &quot;https&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 BRANCH =3D &quot;v2025.04-Beagle&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 SRCREV =3D &quot;ea2aeefcb2de36f8ca1b51d0580=
826d13c01f143&quot;<br>
&gt; &gt; &gt; &gt; &gt;+<br>
&gt; &gt; &gt; &gt; &gt;+BRANCH:beagley-ai =3D &quot;v2025.04-rc3-BeagleY-A=
I&quot;<br>
&gt; &gt;<br>
&gt; &gt; Ugh... this was a build test of Andrew&#39;s patchset!<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; BeagleY-AI support is now in the latest upstream master=
. This branch here<br>
&gt; &gt; &gt; &gt; is missing some updates for BeagleY-AI that can be foun=
d in master.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Would it be better here to take the v2025.07-rc1-Beagle=
 here which<br>
&gt; &gt; &gt; &gt; includes both these additional BeagleY-AI patches and a=
lso PB2 support?<br>
&gt; &gt; &gt; &gt; Maybe it should be the default then.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;d be fine switching to 2025.07 eventually, once it mat=
ures a bit - I&#39;m not<br>
&gt; &gt; &gt; comfortable taking rc1 at this point.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We can do this in stages - now update 6.1 -&gt; 6.12 with 20=
25.04 in a seaprate<br>
&gt; &gt; &gt; branch, then update 2025.04 -&gt; 2025.07 when it&#39;s read=
y (either final or at<br>
&gt; &gt; &gt; least rc3/rc4).<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/beagleboard/u-boot/tree/v2025.07-rc=
2-Beagle" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/beagleboard/u-boot/tree/v2025.07-rc2-Beagle</a><br>
&gt; <br>
&gt; I also tested on 2 BeaglePlay&#39;s and 2 BBAI-64&#39;s.. so i&#39;ve =
moved<br>
&gt; BeagleY-AI, BeaglePlay and BBAI-64 to v2025.07-rc2..<br>
&gt; <br>
&gt; I&#39;ll hack on PB2 over the weekend, that&#39;s going to take more o=
f a<br>
&gt; cleanup for am6232- -&gt; am62 changes..<br>
<br>
Sounds good! I believe this series for meta-ti is ready to be merged, as it=
&#39;s <br>
been in different stages of testing for quite some time, plus the backlog o=
f <br>
pending commits is quite long as it is now. After that we&#39;ll be able to=
 do a <br>
quick U-boot update to 2025.07 in a couple of weeks, once you push your <br=
>
branches and I do quick testing. Ah, and that means I&#39;ll need to get my=
self <br>
a new PB2 A1...<br>
<br>
-- <br>
Denys<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#18598): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/18598" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.yoctoproject.org/g/meta-ti/message/18598</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113155503/361=
9810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/113155503/3619810</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank" rel=3D"noreferrer">meta-ti+owner@lists.yoctoproject.org</a><b=
r>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/meta-ti/unsub</a> [<a href=3D"mailto:robertcnelson@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">robertcnelson@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000098ba350635d6927d--

