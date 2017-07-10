Return-Path: <maciej.borzecki@rndity.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09548E00C29; Sun,  9 Jul 2017 23:43:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.170 listed in list.dnswl.org]
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B755BE00C1C
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 23:43:11 -0700 (PDT)
Received: by mail-wr0-f170.google.com with SMTP id 77so124473480wrb.1
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uBTY2/5Khq68xyP6ri1BnQ01HtZ6PLd5YTpSybcz/Rk=;
	b=KjNqJMoawXxCunHYK4Y0OGHse0S8Lo8AbGG+iATw3rMD2y6Q+Xnsiz+kyGye+mGFkM
	tgbMhzvaQ3/3gGSB2rV8LB2snFcSjfSQu54W74HwZZyfPy3vlcRlWDTb4fcNAoUFVGj9
	wkrfUYPKjS64gVqZNt3zW8Kt/KItjYKxSSHnz7zPXB9+NWfUDt+qeIxTBOJL4TrGdY5N
	bsNxxspyfHqHuuyVNH0ZTcGG64uSiRofTsdha+/QDMVT61/T1x9CAawJyDA9UBSCxuvJ
	YaydaAboHAwS/ZfE6NHyfliLI9IFbZBm/RHxRNf4fQ8bk4P/RXIgyL8cLo3Pt4heq8S3
	uywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uBTY2/5Khq68xyP6ri1BnQ01HtZ6PLd5YTpSybcz/Rk=;
	b=dzSorgwUzCQ3K2oOl6FkyMt5Y7TGOfMzHJUiIgRlFQkGnwD4FioxEj0wmS9AEDIDcm
	maSfra5pjtdfOjB4Z89AiiuA2PtAkzz23D09d51myEruCkQpFeon1xrbWVhyjg64G57w
	zVbBfrwDoqYfMGkYYa8ozJh7IC+xON5y/nzoyRoippuAin8qeN15avH4Me0JlDbDcXai
	WYprm3apkrWr8qcoHRx6FT0SqGTXdpnt9eiCzMTvTgnRiwW29KO4Ol03bhddlFouSriA
	Njx/3cRyce1PGGJBDj3yqH/YETn5by6urhkg2bXoe59KmMm3FNBLgV96NF4Q1Bccqtud
	Jdng==
X-Gm-Message-State: AIVw1130AEpWOyfvPykOh8I0XDWgtskxmAXnTnRrFEQwuibpDJ/p6HVn
	Q9uYxYk+kbId/5ujT/77LQhAXSWm7b6g
X-Received: by 10.28.213.75 with SMTP id m72mr6482184wmg.41.1499668990409;
	Sun, 09 Jul 2017 23:43:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.58.136 with HTTP; Sun, 9 Jul 2017 23:42:49 -0700 (PDT)
In-Reply-To: <01f2c963-0792-0acc-aef0-0e306da52dd1@gmail.com>
References: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
	<CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
	<01f2c963-0792-0acc-aef0-0e306da52dd1@gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 10 Jul 2017 08:42:49 +0200
Message-ID: <CAD4b0_+bXGibsEpsB=r5_7rTB8JTCo3iir70KiN4x628zT94tA@mail.gmail.com>
To: Riko Ho <antonius.riko@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: HDMI and Wifi USB dongle ?
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
X-List-Received-Date: Mon, 10 Jul 2017 06:43:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 8:27 AM, Riko Ho <antonius.riko@gmail.com> wrote:
> I tried with ATX power supply, still get the same response, why is that ?
>

Suggested order of debugging would be:

- look into dmesg and syslog/journalctl for any suspicious messages
popping up when you enable HDMI

- check if order of events has any significance (i.e. HDMI on when
turn wifi on, or wifi on then enable HDMI)

- try a powered USB hub (a passive one may be good enough too)

- try using USB extension cable for the wifi dongle.

The last 2 points are easiest to verify.

>
> On 10/07/17 14:24, Maciej Borz=C4=99cki wrote:
>
> On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <antonius.riko@gmail.com> wrote:
>
> Dear Meta-TI Members,
>
> How can I fix the current issue between HDMI port and Wifi on USB dongle =
?
>
> Everytime I put HDMI, my USB dongle is down ??
>
> I would start by trying to use a decent power supply.
>

--=20
Maciej Borzecki
RnDity

