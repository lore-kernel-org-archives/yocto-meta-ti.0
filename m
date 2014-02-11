Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C435DE00764
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 07:32:10 -0800 (PST)
Received: by mail-qa0-f50.google.com with SMTP id cm18so11730711qab.23
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=frv02X89Gme7HW+/HBrYvtCvuN+WhK9z/RsIQfBagns=;
	b=qMYNTiSIOdr0jUovXJptacE5AFG8sELKQMJp4XJ8xFWMaotOxZ5rOSnGwZQfYBAahP
	XCjgEOY+Kf7lO8gWq5yn+ETNAwJyg1adsW61zkkemDRcPenjkwvFn1LNzej6p6MuLRnn
	DTtCjeKIArmrIamWujq1KML43Rr9PEJ8X0sBXZVhzZ46S85qtBzmK5IISIr31LhVGoJ7
	Q/hzeWjMYG9UOIkElm2fZVYtxi/sDNK7pkInZOYRe53qnjZukklaMnJabOJPGU/pe27t
	ywpiCFKGZnGexXQZmku73j1VXUFTg/udLy4Ei//MBcQXPggrSn3fVbb6q9++hRAkNj0j
	myvA==
X-Received: by 10.140.21.179 with SMTP id 48mr54782979qgl.78.1392132729407;
	Tue, 11 Feb 2014 07:32:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 07:31:49 -0800 (PST)
In-Reply-To: <20140211152805.GK3131@edge>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 13:31:49 -0200
Message-ID: <CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 15:32:12 -0000
Content-Type: multipart/alternative; boundary=001a11c11feed10d5e04f223280d

--001a11c11feed10d5e04f223280d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 1:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Are you using the latest meta-ti?


Yep:
1923b5f (HEAD, origin/dora, dora) u-boot-ti-staging: update with fixes for
NAND partition names and sizes

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11c11feed10d5e04f223280d
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Feb 11, 2014 at 1:28 PM, Denys Dmytriyenko <span dir="ltr">&lt;<a href="mailto:denys@ti.com" target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">Are you using the latest meta-ti?</blockquote></div><br>Yep:</div>

<div class="gmail_extra">1923b5f (HEAD, origin/dora, dora) u-boot-ti-staging: update with fixes for NAND partition names and sizes<br><br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br>

<br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br" target="_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c11feed10d5e04f223280d--
