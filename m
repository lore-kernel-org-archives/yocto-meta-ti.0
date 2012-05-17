Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E947E00746
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 12:30:18 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so6683606wib.11
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 12:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=m9xzctk+j2urHhIicIY54YDOnkdEdztr5Uhno4LHfAM=;
	b=LNW3LLKjd6bYzdP4gdYGdY5/Hz9TGHsD+6QIYkdUhxqzsxb8tBR/ac0lZMVNzdjLUv
	e6AtmxWhHy1LjiHIPLyHyXoWbplHbVBUxt5U63IARvacget8ihlg+vMDJbh701Q/0m2c
	yj/JAxJJtV12xFIHVix0a1GeQUg0DiUgeBaI9D3ne5ZLye3gtspucKCLW037rX15mce4
	drTmlw2bNNqRe36dZj+v3mJMRAa53ad3LRQ5JUACdGMNQ4FeWfggoC3JSE+TYYuegvhB
	xVa40V7umhJ2zg1cMMdELl2Tqe3Ff4RD5IFww2aOF2DrwggocfHoiqLMZ5RVLQvwd5EP
	KLkg==
Received: by 10.180.103.202 with SMTP id fy10mr8310807wib.17.1337283016971;
	Thu, 17 May 2012 12:30:16 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id et10sm47473415wib.2.2012.05.17.12.30.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 12:30:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120517183222.GK6829@denix.org>
Date: Thu, 17 May 2012 21:30:14 +0200
Message-Id: <5F24EB45-2C7F-41E7-B036-6D578DDD5309@dominion.thruhere.net>
References: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
	<20120517183222.GK6829@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmbxDUHjJvmegViiiJ5hOE8DLfGC6BQIxfJ8ech+mjYQa8rkBDv/oGiaoKE8cw1BkTaF4Q3
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti33x-psp 3.2: demote cpsw PHY message to INFO
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
X-List-Received-Date: Thu, 17 May 2012 19:30:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 20:32 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Thu, May 17, 2012 at 12:07:06PM +0200, Koen Kooi wrote:
>> This keeps them from appearing on the screen during quiet boots. They =
are still being reported, so no info is lost.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> ...pws-phy_device-demote-PHY-message-to-INFO.patch |   51 =
++++++++++++++++++++
>> recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
>> 2 files changed, 53 insertions(+), 1 deletion(-)
>> create mode 100644 =
recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-d=
emote-PHY-message-to-INFO.patch
>>=20
>> diff --git =
a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device=
-demote-PHY-message-to-INFO.patch =
b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device=
-demote-PHY-message-to-INFO.patch
>> new file mode 100644
>> index 0000000..2aed646
>> --- /dev/null
>> +++ =
b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device=
-demote-PHY-message-to-INFO.patch
>> @@ -0,0 +1,51 @@
>> +=46rom 04924dfd0335b8adca0e7783112827df30e70a5f Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Thu, 17 May 2012 10:59:18 +0200
>> +Subject: [PATCH] cpsw,phy_device: demote PHY message to INFO
>> +
>> +This keeps them from appearing on the screen when booting with =
'quiet'
>> +
>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> +---
>> + drivers/net/ethernet/ti/cpsw.c |    2 +-
>> + drivers/net/phy/phy_device.c   |    4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/drivers/net/ethernet/ti/cpsw.c =
b/drivers/net/ethernet/ti/cpsw.c
>> +index 86fe57d..d10996d 100644
>> +--- a/drivers/net/ethernet/ti/cpsw.c
>> ++++ b/drivers/net/ethernet/ti/cpsw.c
>> +@@ -638,7 +638,7 @@ static void cpsw_slave_open(struct cpsw_slave =
*slave, struct cpsw_priv *priv)
>> + 		    slave->data->phy_id, slave->slave_num);
>> + 		slave->phy =3D NULL;
>> + 	} else {
>> +-		printk(KERN_ERR"\nCPSW phy found : id is : 0x%x\n",
>> ++		printk(KERN_INFO"\nCPSW phy found : id is : 0x%x\n",
>> + 			slave->phy->phy_id);
>> + 		cpsw_set_phy_config(priv, slave->phy);
>> + 		phy_start(slave->phy);
>> +diff --git a/drivers/net/phy/phy_device.c =
b/drivers/net/phy/phy_device.c
>> +index 83a5a5a..8b84789 100644
>> +--- a/drivers/net/phy/phy_device.c
>> ++++ b/drivers/net/phy/phy_device.c
>> +@@ -380,7 +380,7 @@ struct phy_device * phy_connect(struct =
net_device *dev, const char *bus_id,
>> + 	 * PHY with the requested name */
>> + 	d =3D bus_find_device_by_name(&mdio_bus_type, NULL, bus_id);
>> + 	if (!d) {
>> +-		pr_err("PHY %s not found\n", bus_id);
>> ++		pr_info("PHY %s not found\n", bus_id);
>> + 		return ERR_PTR(-ENODEV);
>> + 	}
>> + 	phydev =3D to_phy_device(d);
>> +@@ -503,7 +503,7 @@ struct phy_device *phy_attach(struct net_device =
*dev,
>> + 	 * PHY with the requested name */
>> + 	d =3D bus_find_device_by_name(bus, NULL, bus_id);
>> + 	if (!d) {
>> +-		pr_err("PHY %s not found\n", bus_id);
>> ++		pr_info("PHY %s not found\n", bus_id);
>> + 		return ERR_PTR(-ENODEV);
>> + 	}
>> + 	phydev =3D to_phy_device(d);
>> +--=20
>> +1.7.7.6
>> +
>> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb =
b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> index 6c5056a..0fe3d4f 100644
>> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> @@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX =3D ""
>>=20
>> BRANCH =3D "v3.2-staging"
>> SRCREV =3D "720e07b4c1f687b61b147b31c698cb6816d72f01"
>> -MACHINE_KERNEL_PR_append =3D "k+gitr${SRCREV}"
>> +MACHINE_KERNEL_PR_append =3D "l+gitr${SRCREV}"
>>=20
>> COMPATIBLE_MACHINE =3D "(ti33x)"
>>=20
>> @@ -970,4 +970,5 @@ PATCHES_OVER_PSP =3D " \
>>     =
file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-a=
d.patch \
>> 	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \
>=20
> This 0044 patch seems to be missing - did you forget to submit it?

No, it's a discrepancy caused by git-am -3 auto dropping patches. The =
upstream patch scripts merges in .17, which I want to hold of on for a =
few days till after the A6 build.

regards,

Koen=

