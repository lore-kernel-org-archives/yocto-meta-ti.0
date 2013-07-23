Return-Path: <b.hutchman@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EA95E0152B
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 10:44:09 -0700 (PDT)
Received: by mail-ee0-f43.google.com with SMTP id l10so4683992eei.30
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qFj+hIBAtYd7NhzLAnWjcdx1m8X9EmjJ49fQP4zMrKA=;
	b=to3dejsN/qY9IDwNG2hPM54DlXvGfThnCXJcN8xbGD4onrWoiabFxrfjo5p1As0qFx
	K45vrafUrgnxgsFmK1BCEDSuhH8ZbuFaX+5hTLJftkZG3DuNUn43qBPzdBwZjyi2cGe+
	u+jFYQu7MvZqawxO5uzqp8j31QPP2SxrOckzmBDrro5pZCjFlqcYVt7RWMe1On3aK5d+
	nqUsB3EEPF85zsPoVnLiWZvkc2YsvbqVHL5KNvM13cuOnm8nBbvRYxdPaL9qZRNdffpP
	hfMpoftIvSaEzZhUj0jOtOEnBBE1F5QCAfda5ffl4JaOeMhSfda/4/8UlynpW+ijRF/0
	jjBA==
MIME-Version: 1.0
X-Received: by 10.14.106.195 with SMTP id m43mr33937383eeg.60.1374601448783;
	Tue, 23 Jul 2013 10:44:08 -0700 (PDT)
Received: by 10.223.195.69 with HTTP; Tue, 23 Jul 2013 10:44:08 -0700 (PDT)
In-Reply-To: <20130723172837.GS31158@edge>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
	<CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015965BBDC@DLEE11.ent.ti.com>
	<CAFZh4h-eQBem7qVQnE_=Hf_bccvONrFA174Xr3AdpGw7-5dawQ@mail.gmail.com>
	<20130723172837.GS31158@edge>
Date: Tue, 23 Jul 2013 13:44:08 -0400
Message-ID: <CAFZh4h9GKXb1wqwV4CDEnodTBnPgRs7wcR+0ps=KTqM5s7n8aQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Which machine type to use for DaVinci DM6446 and TI816x?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2013 17:44:15 -0000
Content-Type: multipart/alternative; boundary=001a11c1b83010226f04e23157aa

--001a11c1b83010226f04e23157aa
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 23, 2013 at 1:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> Brian,
>
> So, are you willing to become a maintainer for that platform? I've heard
> from
> several other people in the community before, who expressed interest, but
> never came back with the final decision yet... Let me know what you decide.
> Thanks.
>
>
>
I'm still going to look into it to see what all is involved before I
commit.  I don't want to say I'll do it and then suck at it if you know
what I mean.  I think the best long term solution for us (with my employee
hat on) is to mainline as much ti816x stuff as possible as it will only
make our life easier since we have products based on that platform.  What
really needs to happen is for the kernel to get mainlined.  I've seen some
folks working on that on the ARM list but haven't looked at their progress
in a while.

For now in order to meet some deadlines, I've simply been building
filesystems/packages with beaglebone as the machine type.  Hopefully that
will allow me to put out enough fires to have time to look into it more.

Regards,

Brian

--001a11c1b83010226f04e23157aa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 1:28 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span>=
 wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br></div>Brian,<br>
<br>
So, are you willing to become a maintainer for that platform? I&#39;ve hear=
d from<br>
several other people in the community before, who expressed interest, but<b=
r>
never came back with the final decision yet... Let me know what you decide.=
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br><br></font></span></bloc=
kquote><div><br></div><div>I&#39;m still going to look into it to see what =
all is involved before I commit. =A0I don&#39;t want to say I&#39;ll do it =
and then suck at it if you know what I mean. =A0I think the best long term =
solution for us (with my employee hat on) is to mainline as much ti816x stu=
ff as possible as it will only make our life easier since we have products =
based on that platform. =A0What really needs to happen is for the kernel to=
 get mainlined. =A0I&#39;ve seen some folks working on that on the ARM list=
 but haven&#39;t looked at their progress in a while.=A0</div>
<div><br></div><div>For now in order to meet some deadlines, I&#39;ve simpl=
y been building filesystems/packages with beaglebone as the machine type. =
=A0Hopefully that will allow me to put out enough fires to have time to loo=
k into it more.</div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div></div>

--001a11c1b83010226f04e23157aa--
