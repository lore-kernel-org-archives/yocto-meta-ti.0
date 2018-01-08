Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3628EE00CBE; Mon,  8 Jan 2018 10:44:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A8D8E008FB
	for <meta-ti@yoctoproject.org>; Mon,  8 Jan 2018 10:44:37 -0800 (PST)
Received: by mail-yb0-f175.google.com with SMTP id s10so4918410ybl.7
	for <meta-ti@yoctoproject.org>; Mon, 08 Jan 2018 10:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lL3cjVHtedQYTlN6VwiA963oNRAOfkkBF0XYaGIkAeA=;
	b=dY04h+tU8MDXWUA3LiWw0kCeuJ1r2AZubZ3+HvLM0APFB7Xsl0SLBA4vg7uys1LjiK
	cYTSSsnc7gkgVt6jNmAh32v9RS5ZVlB0tDoSQKE0HD6uirEAJ5duH98k0EtgqljLdQ5l
	DfaTJ1Tm8MSoCTfOLas3MBCbT4txmjjQU7cwia/Sjse1XwUOEePOC2FeJW+4guiXGaMI
	OxdKct/EYESYG5LR/iLZ6g1jLkSeTFtaSdT22PXqCjJ7ok6Z9bbaBI4cvKCoJimJ1X97
	AwtdQcp2ENtEXF/flL0vV09NLA50xbD4cvb4WgZ12GhhWArMuk+I8iS5po6uK3NJ7OpC
	3q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lL3cjVHtedQYTlN6VwiA963oNRAOfkkBF0XYaGIkAeA=;
	b=aF2WmiT2F7dvR0UIva245ilDVcsiwCf9HDTqE4+4PEz5aQ9gc0sy2xgAQtL6rVkn22
	zfp+p5eucsFnMECjdXARxr5JaU5rQYjG9Rut1tuslqfBRMg5fVD3Ex1vNcGFN64LS/eQ
	9el9JWVL4+XBk0lb0vZCSxNlPgWNaN+Y5a4RX0rbIcTma1wijjvDyiY0W3HI1Q5+7ytD
	ltAPgyxXmSnYxUfnOEt40zGmMN/7RTyMjMA63CVHIL5+XpB2B4d5Epm9SuhzeMwb8RDB
	Yv+3wqURif1ioe/NrmSsKnsBPnjlvt7KFjcEUm2xNVptIvNUK5ELc0fND4e0fZSglGIg
	2nEQ==
X-Gm-Message-State: AKGB3mKgtlM+Z7r8176LQ3zSW/nKk7RSfSMPfgCwFxTMjjeNVxSuPHqv
	Op1aVqM78nWwMmOucWh0ZRLGA8b2L4QCMGi2Sr8=
X-Google-Smtp-Source: ACJfBov2TWOpVTG4ZdgZyFu+vBkI2dBtkounj5WjOCUgMwbiVWw1/MncZYXRe9l+Oenb4ETeSz4HEQgyfrhUtFZnCss=
X-Received: by 10.37.185.6 with SMTP id x6mr5332602ybj.496.1515437076796; Mon,
	08 Jan 2018 10:44:36 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 08 Jan 2018 18:44:26 +0000
Message-ID: <CAFeBWL56oQWK7eGSkb0=9Px-R7qqGpJxjOWU-GanxhX-CGq47w@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Rocko and Weston Desktop Shell
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
X-List-Received-Date: Mon, 08 Jan 2018 18:44:39 -0000
Content-Type: multipart/alternative; boundary="089e08264cf8a45c68056248308e"

--089e08264cf8a45c68056248308e
Content-Type: text/plain; charset="UTF-8"

Hello everyone, on my am57xx-evm target, using meta-ti's Rocko branch, I
can't seem to get the Weston desktop shell come up.
It is stuck at "please wait" in black screen.

Is this a known issue..?

Adam

--089e08264cf8a45c68056248308e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone, on my am57xx-evm target, using meta-ti&#39=
;s Rocko branch, I can&#39;t seem to get the Weston desktop shell come up.<=
div>It is stuck at &quot;please wait&quot; in black screen.</div><div><br><=
/div><div>Is this a known issue..?=C2=A0</div><div><br></div><div>Adam</div=
></div>

--089e08264cf8a45c68056248308e--
