Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.554.1634683935372121490
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 15:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A0C640BE9;
	Tue, 19 Oct 2021 22:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zLJnyfbs_NM; Tue, 19 Oct 2021 22:52:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 035B840A47;
	Tue, 19 Oct 2021 22:52:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 56AAE1746A0; Tue, 19 Oct 2021 18:52:12 -0400 (EDT)
Date: Tue, 19 Oct 2021 18:52:12 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] ti-sgx-ddk-km: module installed but not shipped
Message-ID: <20211019225212.GU10132@denix.org>
References: <20211019173010.GB3938936@t480s.localdomain>
MIME-Version: 1.0
In-Reply-To: <20211019173010.GB3938936@t480s.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 05:30:10PM -0400, Vivien Didelot wrote:
> Hi,
> 
> With latest master(s), ti-sgx-ddk-km fails with:
> 
>     ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package: QA Issue: ti-sgx-ddk-km: Files/directories were installed but not shipped in any package:
>       /lib
>       /lib/modules
>       /lib/modules/5.10.59-g04b02a7e8e
>       /lib/modules/5.10.59-g04b02a7e8e/extra
>       /lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko
>     Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>     ti-sgx-ddk-km: 5 installed and not shipped files. [installed-vs-shipped]
> 
> But adding a ti-sgx-ddk-km_1.17.4948957.bbappend recipe containing:
> 
>     FILES:${PN} += "/lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko"
> 
> won't fix the problem if DISTRO_FEATURES contains "usrmerge":
> 
>     ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package_qa: QA Issue: ti-sgx-ddk-km package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
> 
> Instead this unrecommended workaround fixes the task:
> 
>     do_install:append () {
>         mkdir ${D}/usr
>         mv ${D}/lib ${D}/usr
>     }
> 
> This seems like a regression with the prefix passed to the module install
> step, forcing ${D}/lib instead of ${D}/usr/lib when usrmerge is enabled.

No regressions - this part hasn't change forever. The internal Makefile 
framework in SGX and RGX packages is very generic and convoluted, plus 
somewhat old and outdated - it has no knowledge of "usrmerge" concept 
and simply installs modules under /lib/modules under rootfs hierarchy. 
The recipe doesn't dictate that, it just passes ${D} down as the rootfs 
hierarchy. But I think I have a workaround for this...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
