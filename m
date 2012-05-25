Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3026E01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 04:51:32 -0700 (PDT)
Received: by eekb45 with SMTP id b45so235915eek.35
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 04:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=W2xaruCOUiUn1qAxubPPZ9kOsbnQLN/wM9e3R2XFNWQ=;
	b=QkmQZ1SSK9zRdOSjWhzs/DRyWuWwEMCov8KGFmUj206V5464tvwm01TOazDVHrQEYa
	0vkGMub92DPfkebp+2dD6zCoJrzbJqiOtsZ2g3tvBlgaWxpxA8LPvf1Q+KLV6guiDf2B
	qvwhCgIIAfv/TWM4R9AZAB8fS56QvRcRiS4sckSkUk9RGC/lrSrrCqdzoGMGMI6Ssk4A
	X4aCoEla8blJB0/Pzz8ewIPMUct1lmS2SJBx4Hdl8XFc/4+xoTAtedvggOUCkXnzQHY2
	nFp2rwbzoIbaWA8Qrm/JsU8R2hSeaCGIFUx9exJC+byRwTOhIJPx+F7NWHtsNaA7wZ+V
	eGeg==
Received: by 10.14.53.79 with SMTP id f55mr602012eec.69.1337946691468;
	Fri, 25 May 2012 04:51:31 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s8sm6365584ees.16.2012.05.25.04.51.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 04:51:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBF7014.8080609@mlbassoc.com>
Date: Fri, 25 May 2012 13:51:28 +0200
Message-Id: <EF72DCD2-DC86-47B9-80D1-8D647638DAF8@dominion.thruhere.net>
References: <4FBBB531.8020401@communistcode.co.uk>
	<4FBBB786.8030501@mlbassoc.com>
	<4FBBB8E9.1040700@communistcode.co.uk>
	<20120522163158.GB15020@denix.org>
	<4FBCA367.701@communistcode.co.uk> <4FBCC147.90606@mlbassoc.com>
	<4FBCE8E4.6010208@communistcode.co.uk>
	<4FBE44EE.2070909@communistcode.co.uk>
	<4FBE4DE9.30501@mlbassoc.com> <1337928496.8248.173.camel@ted>
	<4FBF7014.8080609@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmA5FEpeuxuRjIfTamXFSFyWWXoexGXZlmNpFe5kb9JnCHMGZYmNs4x92WNTx3zKcEBCVO/
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Beaglebone + Poky
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
X-List-Received-Date: Fri, 25 May 2012 11:51:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2012, om 13:42 heeft Gary Thomas het volgende geschreven:

> On 2012-05-25 00:48, Richard Purdie wrote:
>> On Thu, 2012-05-24 at 09:04 -0600, Gary Thomas wrote:
>>> I agree - there seem to be some recipes in meta-oe that don't play
>>> nice with a non-systemd setup like Poky.
>>>=20
>>> Note: I was able to boot core-image-minimal built with meta-yocto + =
meta-oe
>>> in all configurations of EXTRA_IMAGE_FEATURES as long as 'dbg-pkgs' =
was
>>> not specified.  As soon as I added that feature, it fails to come up =
just
>>> as you observed.  I'm not sure why (and I'm not too motivated to =
research
>>> more, I've already built this thing about 20 times in different =
ways...)
>>=20
>> That is a useful data point to have though, thanks for mentioning it =
on
>> the list!
>>=20
>> I wonder if that somehow indirectly pulls in systemd itself?
>=20
> It does seem so.  I'm not sure what package caused it.  The attached
> list of files (anything that mentions systemd) might give a clue.

This is exactly what I designed testlab.bbclass for, which is now called =
buildhistory.bbclass=

