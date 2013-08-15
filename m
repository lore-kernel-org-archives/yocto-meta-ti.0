Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DE5DE01412
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:15:00 -0700 (PDT)
Received: by mail-ob0-f181.google.com with SMTP id dn14so1382094obc.12
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Kv5MrwV0+D35vFXzUbW2ldqRclAFRBOEM4Eu4grJSvU=;
	b=jwR8GTnEQaO9TD/1WmNgyorO75vHvF/AKfhtbig1Y1naKG5mCZwJhDyJ6aIn7K38K/
	QWLyw9UaVWlgMyMQQR5u6CgVL+r/DwWRx9j24pfGN918OYsg1+vqOaBTZ6MOnCtbtEBD
	A6yg4EmN6uKEJGRtmUVDQyVtU6hNkpcLTRe99zSbTJwfDRQfckiOXfGI5oaMBCWNlfT2
	hpn82AWPSeyQwbZG7XPGw4QdRahkjYO67s+LPtpNIv6rUQtMX6S3R5qeymDqt/jEvZ2r
	D4BvloCZA+WK3p//X9/6bLO07OCie9y0rv6OigSmCHtzZHuwJ29hj/cjpGHSnWzuDo2b
	Niug==
MIME-Version: 1.0
X-Received: by 10.60.98.239 with SMTP id el15mr12096142oeb.13.1376601299917;
	Thu, 15 Aug 2013 14:14:59 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 14:14:59 -0700 (PDT)
In-Reply-To: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
Date: Thu, 15 Aug 2013 17:14:59 -0400
Message-ID: <CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 15 Aug 2013 21:15:01 -0000
Content-Type: multipart/alternative; boundary=089e011837067aa54504e402f7f0

--089e011837067aa54504e402f7f0
Content-Type: text/plain; charset=ISO-8859-1

Update.  Well, adding Sakoman's patch to head.S and compiling with
-mno-unaligned-access
didn't appear to help so far ... :(

Regards,

Brian

--089e011837067aa54504e402f7f0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Update. =A0Well, adding Sakoman&#39;s patch to head.S and =
compiling with=A0<span style=3D"color:rgb(0,0,0);white-space:pre-wrap">-mno=
-unaligned-access didn&#39;t appear to help so far ... :(</span><div><span =
style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br>
</span></div><div><font color=3D"#000000"><span style=3D"white-space:pre-wr=
ap">Regards,</span></font></div><div><font color=3D"#000000"><span style=3D=
"white-space:pre-wrap"><br></span></font></div><div><font color=3D"#000000"=
><span style=3D"white-space:pre-wrap">Brian</span></font></div>
</div>

--089e011837067aa54504e402f7f0--
