Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BDF8E0053A
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 05:52:07 -0800 (PST)
Received: by mail-pd0-f182.google.com with SMTP id v10so8982289pde.41
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=tu6fv/xXkp0hBByvXSbVz1clunkbrt2Ovg+UONZrHEs=;
	b=tu2UAdPi2I3OUJcycvFPcACnMp30ks4lNaNeXqijYT3iVslJYdQqJetEuvfjRRigAy
	B9OBuPtFsPDHQobPHm9nbUpLGAlWshtWpSL1VNtCwW0qTzbxEKn0Z8bzJWk2HesRKTZq
	YqPowTcXQ0hN47pFtTMgxNEctUuIYfGIhwUwQWnCK4EThPLt3sUaVqpobOfQYWi7TJxV
	LjIMDk3jTLuM6u80eObdeySDud7a5SyP3hEiUzL2Tgqyv5fv6MQ+bXgcdohTOOURPQwk
	aqGCb4uUo+GWfZKLxgOA8fzk6NKwKuC7K4QT4TdwxVhyOL/U/Ix6Lbi3w+XFCPncR7Xm
	BANg==
X-Received: by 10.66.243.131 with SMTP id wy3mr16477316pac.32.1392213127552;
	Wed, 12 Feb 2014 05:52:07 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	om6sm63885461pbc.43.2014.02.12.05.52.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 05:52:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
Date: Wed, 12 Feb 2014 05:52:05 -0800
Message-Id: <C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
To: =?iso-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
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
X-List-Received-Date: Wed, 12 Feb 2014 13:52:08 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_134E797C-1A71-4C50-8996-73F62AF0650A"

--Apple-Mail=_134E797C-1A71-4C50-8996-73F62AF0650A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Feb 12, 2014, at 2:46 AM, Richard R=F6jfors =
<richard.rojfors@gmail.com> wrote:

> Now when oe-core is on gcc 4.8 (and there is some binary =
incompatibilities between gcc 4.7 and 4.8) I think it's getting =
important to get those binary blobs out compiled with gcc 4.8.
>=20
what incompatibilities do you see between 4.7 and 4.8 ?=20=

--Apple-Mail=_134E797C-1A71-4C50-8996-73F62AF0650A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;"><br><div><div>On Feb 12, 2014, at 2:46 AM, Richard =
R=F6jfors &lt;<a =
href=3D"mailto:richard.rojfors@gmail.com">richard.rojfors@gmail.com</a>&gt=
; wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;">Now =
when oe-core is on gcc 4.8 (and there is some binary incompatibilities =
between gcc 4.7 and 4.8) I think it's getting important to get those =
binary blobs out compiled with gcc 4.8.</div><br =
class=3D"Apple-interchange-newline"></blockquote></div>what =
incompatibilities do you see between 4.7 and 4.8 ?&nbsp;</body></html>=

--Apple-Mail=_134E797C-1A71-4C50-8996-73F62AF0650A--
