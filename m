Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE368E013A7
	for <meta-ti@yoctoproject.org>; Fri,  9 Mar 2012 10:38:04 -0800 (PST)
Received: by wibhr17 with SMTP id hr17so675955wib.5
	for <meta-ti@yoctoproject.org>; Fri, 09 Mar 2012 10:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3/ibxfrncvMw05HsxlTlbCdjrrJBm9UMZcqxN9VDEjU=;
	b=brFZW+5oGSERgtFkwbg/jHv6zpK1YY5VQ0ekEGGllFm89AZV79FONUPNzrTSvEPVZv
	nO+A5dRSzp4aP22jqphaf8/YTpz5/okhaVroJwBsZgjdYyKmrRmWszWMjhAFIRSW2HmL
	7lDGHIJ7AEu8ja/ivFqXk3TUJLckiT2jH/clB3FvgZEJFNZYmXX4DDl1hjeCnlGrtazh
	DwLrUxmH+GGfcrQj85uzdxIfHHpU++jgY9OFr5NwLh/lrNpsiygNVvtB6pxjnQQu3lC1
	3mGbxkD6IDt7eEgNaWSFmeHV3OzFXcz4wWaLlO1ZZAKA3kyR4a9g9AJM3JWhgtrx60J0
	G8QQ==
Received: by 10.180.92.71 with SMTP id ck7mr8258072wib.3.1331318283430;
	Fri, 09 Mar 2012 10:38:03 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d7sm13451975wiz.6.2012.03.09.10.38.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 10:38:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120309155419.GA11879@bill-the-cat>
Date: Fri, 9 Mar 2012 19:38:00 +0100
Message-Id: <4DFEB446-8F7C-4F8C-8EC8-1868474CA8C5@dominion.thruhere.net>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1331235244-5173-5-git-send-email-trini@ti.com>
	<C56154A0-7259-4B52-92BE-C29433260320@dominion.thruhere.net>
	<20120309155419.GA11879@bill-the-cat>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmBrF2PMeh3BsHV4WX6KhSAYigt7+VWQPlSOqwN4jwc1/zGplJxglinE9wyCVBmO6avD4UP
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/4] am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2012 18:38:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mrt. 2012, om 16:54 heeft Tom Rini het volgende geschreven:

> On Fri, Mar 09, 2012 at 07:16:22AM +0100, Koen Kooi wrote:
>>=20
>> Op 8 mrt. 2012, om 20:34 heeft Tom Rini het volgende geschreven:
>>=20
>>> We also change to using '+=3D' not '?=3D' with IMAGE_FSTYPES and add =
the
>>> required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
>>> line that sets us to use the PSP kernel tree and reference the TI =
wiki
>>> for the source of our info.
>>=20
>> The OE classic way of documenting is a lot better and doesn't rely on
>> wiki pages but on the submitter actually checking the output of the
>> commands. So please use the old style way of documenting the params.
>=20
> I disagree here.  The wiki page here

It is still external documentation for things that people will get wrong

> has the calculations as to why the
> erase size is 126976 whereas just doing ubiattach will only print out
> the in-use value.  How about adding a line about verifying these with
> ubiattach or dmesg ?

That would be best. I should only need the machine.conf and the target =
board to figure out ubi params, not some random wiki=

