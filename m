Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14C14E0090C; Mon, 18 Jan 2016 20:33:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
	DKIM_SIGNED,DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=no
	version=3.3.1
X-Spam-HAM-Report: *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4999]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.52 listed in list.dnswl.org]
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94369E008F5
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 20:33:54 -0800 (PST)
Received: by mail-pa0-f52.google.com with SMTP id uo6so430581151pac.1
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 20:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=DLa8W04NtiP0F0GY0IIVV9K+xpVytJ8ttSDwXM1WspQ=;
	b=vKQTWygCXsyaBJlzKm9W6vL2gYy0IwH4r2pCcyaIeFD1WQkeHhCGJWMf1Yp3j9Z6uF
	twV6HpOstF74qSPuC/pLE1vfmgPXWLcBJh0DrxPnelpuCJrDFqq55NJlszrAotqSYMjc
	heLIMVX/ZO5Vq/MjM+ZbtVUrUOFlM7QPvqKbI+dqbhyM05qQpMhcSp2GcOqf5kI75FXd
	FdCqzyegnQNAnsJ6VuDGo9KUbjmjlyL3N22i8sNskf3i8dnnJTUz0R4aioqeNr0bRDUS
	ODhu5N1Dt6GdfLTJM+2cGEvRuQciT1dPIMOW/EQjJ4viCvZv74zaghNWRnCdlnP15/op
	IYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=DLa8W04NtiP0F0GY0IIVV9K+xpVytJ8ttSDwXM1WspQ=;
	b=TCJjbdLpPIoj+ma84Xs9mp6d0DyA1kDlegTUJ5Z/NuaG4o+YnErEQEZfUu7RGNWLHW
	HRJJqj3H2Y7EXAVUNZWSv9HomiII4LDZE8wrvF36/AviGL7RSg4lWbSPyTxEQiQA4UsW
	G3jD8yDTwNM7R0nFwrvkqEye1cjc/G/lstCD8W1cmWOsQBeNnIrozuIkuqZnSx66249G
	BHeGNzIenoQY4aCGyGM3ObUwpWIsEVPuC63crw3ZPPq9u8dzRCp5udfeD2U06iz3cI4f
	w+U0tG2FJs175hV9vyurdLBu8DJFByYh9RMkdDKHmY/jFBLnwQnxEANAEgzCMtKZMiZn
	6UHg==
X-Gm-Message-State: ALoCoQmqpykEQM8AaI6ARyM28nKN9hnNbuhKxMALZ/WmZLnU0vBttEfqElUdDw3DNFplkwSxxRqOGUjF+4NvczrRs0vQIHQ20A==
X-Received: by 10.67.22.97 with SMTP id hr1mr41661772pad.49.1453178033899;
	Mon, 18 Jan 2016 20:33:53 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	ss5sm5284515pab.15.2016.01.18.20.33.50 for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 20:33:51 -0800 (PST)
Message-ID: <010D464DD7F94DAB8203AA5BF850771E@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Tue, 19 Jan 2016 10:08:18 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Regarding Texas AM437x with yocto project
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
X-List-Received-Date: Tue, 19 Jan 2016 04:33:57 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003A_01D152A1.51EDDB50"

------=_NextPart_000_003A_01D152A1.51EDDB50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Sir/Madam,

I plan to use Yocto project in our new project. Our development system =
is Texas based AM437X.  I am new to yocto project. How do I start the =
project?
Note : We are keen to develop embedded linux with navit (Navigation =
software ).

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_003A_01D152A1.51EDDB50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear Sir/Madam,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I plan to use Yocto project in our new project. Our development =
system is=20
Texas based AM437X.&nbsp; I am new to yocto project. How do I start the=20
project?</DIV>
<DIV><FONT color=3D#0000ff>Note : We are keen to develop embedded linux =
with navit=20
(Navigation software ).</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV style=3D"FONT-FAMILY: ; COLOR: ">Regards,<BR>Winiston.P<BR>Futura =
Automation=20
Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax =
:91-80-28375291</DIV>
<DIV>&nbsp;</DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_003A_01D152A1.51EDDB50--
