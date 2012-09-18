Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93EBBE002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:16:25 -0700 (PDT)
Received: by bkty5 with SMTP id y5so3019964bkt.35
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=PDOJSqRs0Ypk45XimL3z8vczljD5/o/Dyl+LqG0kXps=;
	b=ga6iwqBsB8lAhyq/AcEiIDZ+BX3410vlOUgEBiCZwi8fi7iF22s48M9L5xmxC1y+wy
	cqpLSWOzsr+8y4FwhoZPbF3dlhUAC/yIoyaDe0VyEHLG8KrjVd1HpjlBktkMwSWol8vf
	WpptOu1qjsMsTfKOYQvNMxi0vDaWL/SCEKfsqVRyslg4JvTe0QrgFUykfeYfzGmvgCS/
	c372TVkCK2qD2DTTW0Gn4xoDIf7jIPfX1KMqLtm8PbJ5pHUidBMQwtE38cl4+EIguTnW
	Sd6ifgNJS28nMfhSBEVmcy5FTrg0SRbJ84CEp80ABGDr+8Tm+YXcp6wt5jPYdZDEbHry
	nNRA==
MIME-Version: 1.0
Received: by 10.204.129.27 with SMTP id m27mr4979673bks.115.1347927384182;
	Mon, 17 Sep 2012 17:16:24 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.205.41.67 with HTTP; Mon, 17 Sep 2012 17:16:24 -0700 (PDT)
In-Reply-To: <20120917215556.GC1218@denix.org>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
	<20120917215556.GC1218@denix.org>
Date: Tue, 18 Sep 2012 02:16:24 +0200
X-Google-Sender-Auth: cpsBGIAD5vT51hT_eSaRemb_Dzg
Message-ID: <CA+2YH7tBSPwX4aoO3xX4ArU7CX=j5jVCSK5os4Jkvp=OCL8PqA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Tue, 18 Sep 2012 00:16:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 17, 2012 at 11:55 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Mon, Sep 17, 2012 at 10:36:20PM +0200, Enrico wrote:
>> Sorry to jump into the discussion but...am i the only one that thinks
>> that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?
>
> Not to argue that it's better, but how is it different from meta-cedartrail,
> meta-crownbay, meta-emenlow, meta-sugarbay and all the other Intel boards?

I admit i know nothing about them and why they are organized like that.

But, in my experience, it's really useful to see what happens in
boards similar to what i'm using/developing for. For example thanks to
Koen beagle patches i learned about smartreflex and crashing dm3730,
or a patch coming from linux-omap to enable 720mhz on 3530, or a patch
to fix mmc timeout issues. (i know, pretty old examples!).

In other words the more i know about an arch, the better it is. And
it's easier to follow meta-ti instead of meta-beagle-that-is-not-ti,
meta-panda, meta-whatever, expecially when i have no (direct) reason
to use those meta layers.

But i maintain nothing in meta-ti so it's easy for me to see it in this way.

Enrico

