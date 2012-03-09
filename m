Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 361CFE0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 22:16:21 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so1220425wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 22:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=cd8RS8/RtpGnzcMIomPWNT9lGZlqlae4Kqhmj0RvZec=;
	b=fM8CqODD4vzeEWqz4US7to7LtVYuFTK1IQ1apz+DHEs7nW6gNOJRrgo/LmFBSTxyq6
	DQGFgPLcG0gVS0So7vYcj3lLKAb13Ipq4E9xcXYkumEFCIkdK6LaYdo72lTwVQ9DDQSz
	Lyr8uQYWPzLCsd3IjCJh0+uf24zHlT5GoPFvjdnDgFJH157lqO2Y6RP3DGT1pk90oHbL
	cGrcTt46pauW/rYY3tA9rbDaiIuhvxyYOCoGjJv/ayKrldkHCt+jfa2VpwtZ5bBKRuOD
	ahr3/R5Zj7lxwMWSbv9LgegsifpZ2f+yTKehRGjiVG+ZZCLMZiz3L8wc2V4jFmHaqBej
	ar9Q==
Received: by 10.216.131.154 with SMTP id m26mr599233wei.91.1331273780770;
	Thu, 08 Mar 2012 22:16:20 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm2470315wib.1.2012.03.08.22.16.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 22:16:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1331235244-5173-5-git-send-email-trini@ti.com>
Date: Fri, 9 Mar 2012 07:16:22 +0100
Message-Id: <C56154A0-7259-4B52-92BE-C29433260320@dominion.thruhere.net>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1331235244-5173-5-git-send-email-trini@ti.com>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnpVz1XUNkhBTDb6ctiiQjbwC2kXIBi8KtaS+RhEd//uK3uZPVEChUC34nBfPBhsZ0o95pk
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
X-List-Received-Date: Fri, 09 Mar 2012 06:16:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mrt. 2012, om 20:34 heeft Tom Rini het volgende geschreven:

> We also change to using '+=3D' not '?=3D' with IMAGE_FSTYPES and add =
the
> required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
> line that sets us to use the PSP kernel tree and reference the TI wiki
> for the source of our info.

The OE classic way of documenting is a lot better and doesn't rely on =
wiki pages but on the submitter actually checking the output of the =
commands. So please use the old style way of documenting the params.

regards,

Koen=

