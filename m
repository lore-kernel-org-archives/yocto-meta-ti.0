Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 673F7E01440
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:39:59 -0700 (PDT)
Received: by mail-oa0-f44.google.com with SMTP id l20so1340426oag.17
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+OOeYkyeaSX53JSejcAfQKJg2W2UX3e9VlPg14bm1fA=;
	b=LLp4XwFscd5adGWnctjchRuTi9oSaRgmVDUK6tQLGxvqzmwpg0qcizttYcHk/hAwK8
	xG3B1sGEvIsFmDsLlNf3DKqVlHtCePp2KLQO1Cx40Lo2sVv4fmXLx7Uj182Czbx0LziN
	WglcncGLJ2TmaK/XA28xz9oL9tFv5UHklFJ2PuSX6CMB774X1WvTHd51vitWjPHHwCaF
	pJrm+cg4cd92re55TGS7zs/sGVTS5pOH/0VKAHPKmS4Mva0iNT7myLI0R3hlOW9wRMgk
	JFE+xLbiKcGDTdQ7uYxsjOIdxAQYwsQTWa7S1Xpry+7iyho7Sk3zHyDTidKL7ARynBwy
	rsrg==
MIME-Version: 1.0
X-Received: by 10.182.226.199 with SMTP id ru7mr29969417obc.12.1376595598693; 
	Thu, 15 Aug 2013 12:39:58 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 12:39:58 -0700 (PDT)
In-Reply-To: <20130815193427.GJ2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<20130815190600.GF2190@edge>
	<CAFZh4h9xR44AvSW91eg_ecH0kR=760e5v1MC97r4hsjaB09Htw@mail.gmail.com>
	<20130815193427.GJ2190@edge>
Date: Thu, 15 Aug 2013 15:39:58 -0400
Message-ID: <CAFZh4h-jHn8+QT=0_OBPxERq8dZRQwRosEUwwAoJ8Vqjcc2xxw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:40:02 -0000
Content-Type: multipart/alternative; boundary=001a11c309aaa8dd0e04e401a367

--001a11c309aaa8dd0e04e401a367
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 3:34 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> So, cross-referencing the 2.6.37 release date of January 4, 2011 against
> gcc
> releases shows that you can only expect 4.4 or 4.5 to work properly out of
> the box w/o patching... :)
>
> And I have already answered the "newer TI81x kernel" question many times,
> including the last email in this thread :)
>
>
The horse isn't dead yet!  The beatings will continue until morale
improves. ;)

--001a11c309aaa8dd0e04e401a367
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 3:34 PM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
</div></div>So, cross-referencing the 2.6.37 release date of January 4, 201=
1 against gcc<br>
releases shows that you can only expect 4.4 or 4.5 to work properly out of<=
br>
the box w/o patching... :)<br>
<br>
And I have already answered the &quot;newer TI81x kernel&quot; question man=
y times,<br>
including the last email in this thread :)<br><span class=3D"HOEnZb"><font =
color=3D"#888888"><br></font></span></blockquote><div><br></div><div>The ho=
rse isn&#39;t dead yet! =A0The beatings will continue until morale improves=
. ;)</div>
</div><br></div></div>

--001a11c309aaa8dd0e04e401a367--
