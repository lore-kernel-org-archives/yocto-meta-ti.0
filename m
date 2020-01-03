Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.285.1578078623940965275
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jan 2020 11:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WTGCR59m;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003JAMNX096491;
	Fri, 3 Jan 2020 13:10:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578078622;
	bh=xMZ6ZLBJpS/S6qhWmHc2Jztq9hDMvTF5SgoEBttRv5E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WTGCR59m04iJHXVKQYkirC/hgk3FxItE4jxsHEvom5a3PS163SjS7if92rw09hR6k
	 AFPx929WgicrTSGWr6vsesFJCcBdjXUBhaCENygTO1xwAMWqePMHApPpFijsd6HS2r
	 7Rr0BLbxRqni+vEWLnyk3lYuKgk+73lzb5UcbEok=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 003JAM4W007266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2020 13:10:22 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Jan
 2020 13:10:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Jan 2020 13:10:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003JAL5Q113076;
	Fri, 3 Jan 2020 13:10:21 -0600
Date: Fri, 3 Jan 2020 14:10:21 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH v3] rwmem: Delete
Message-ID: <20200103191021.GE15325@beryl>
References: <20200101112144.3267596-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200101112144.3267596-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Busy holidays? :)
Thanks, merged!

-- 
Denys


On Wed, Jan 01, 2020 at 03:21:44AM -0800, Khem Raj wrote:
> Already migrated to meta-oe
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v3: Delete recipe, its already in meta-oe now
> 
>  recipes-bsp/rwmem/rwmem_1.2.bb | 27 ---------------------------
>  1 file changed, 27 deletions(-)
>  delete mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb
> 
> diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
> deleted file mode 100644
> index 0545b0cc..00000000
> --- a/recipes-bsp/rwmem/rwmem_1.2.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "A small tool to read/write memory"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -DEPENDS += "python3"
> -
> -PV .= "+git${SRCPV}"
> -
> -SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
> -SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
> -SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
> -
> -SRCREV_FORMAT = "rwmem_inih_pybind11"
> -
> -SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
> -           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
> -           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
> -inherit cmake pkgconfig
> -
> -do_install() {
> -	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> -	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> -}
> -- 
> 2.24.1
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12590): https://lists.yoctoproject.org/g/meta-ti/message/12590
> Mute This Topic: https://lists.yoctoproject.org/mt/69362008/1051543
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denys@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

