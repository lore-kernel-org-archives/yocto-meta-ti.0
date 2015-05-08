Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD1ACE00A04; Fri,  8 May 2015 09:24:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.171 listed in list.dnswl.org]
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 552A3E009F8
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 09:24:24 -0700 (PDT)
Received: by pdea3 with SMTP id a3so90826339pde.3
	for <meta-ti@yoctoproject.org>; Fri, 08 May 2015 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=o8/ZCz8CZz2GAklmV3AXNydh2U2PX3UK0fwViuVFk+o=;
	b=a1eDYsEC775p0Dd7OQA68AzXQakh6HUznBRwfGElZZ+XMH5hib5usqwwsRNj8krylR
	v/nZAIOyr0LyLYiwgkygg4RG11K78iHSpqhe9BSxoG58ei6RXU3xfpAZVesld3blpC8Q
	D70+dXsQUAppsywiPT2cmuOOAv/GAWM/Wbz5JJT28NaygwndUdcj5tGSZVdY2K7Grp2m
	zpgkkZreSD/9K7qDD8K2Kb5sHG7qK5TTAAjyxf1rTzxYwZM8TIMRsUCnvFJuWmgL9bp/
	X+hvQIAlDzkmc4qzjoBBa4j6ViNf3nXiA8h+dEHFiStHAmfqISa1K6ICGeYhAFBFfhHz
	gmVg==
X-Received: by 10.68.191.229 with SMTP id hb5mr7782711pbc.126.1431102206130;
	Fri, 08 May 2015 09:23:26 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j14sm5653336pbq.29.2015.05.08.09.23.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 May 2015 09:23:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431094194-11852-2-git-send-email-j-stiffler@ti.com>
Date: Fri, 8 May 2015 09:23:24 -0700
Message-Id: <22A42254-B630-4E50-BB82-A52F1FA2CD84@gmail.com>
References: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
	<1431094194-11852-2-git-send-email-j-stiffler@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
X-Mailer: Apple Mail (2.2098)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] ti-xdais: Add version 7.24.00.04
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
X-List-Received-Date: Fri, 08 May 2015 16:24:26 -0000
X-Groupsio-MsgNum: 6252
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D2A7AD07-3191-4172-A9D5-76ADE5062A85";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D2A7AD07-3191-4172-A9D5-76ADE5062A85
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On May 8, 2015, at 7:09 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
> 
> +INSANE_SKIP_${PN} = "installed-vs-shipped"

can this be fixed instead ?

--Apple-Mail=_D2A7AD07-3191-4172-A9D5-76ADE5062A85
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVM4vwACgkQuwUzVZGdMxThbACfWZalRwuhVJaf41W/xYDLaFmj
82wAoIdDDI4EaSQbyP1EJrgnkjO+K4xZ
=Mb/8
-----END PGP SIGNATURE-----

--Apple-Mail=_D2A7AD07-3191-4172-A9D5-76ADE5062A85--
