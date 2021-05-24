Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1554.1621893124594911434
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 May 2021 14:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bQ0/lUy1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OLq2OQ010996;
	Mon, 24 May 2021 16:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621893122;
	bh=it+O9C0JYbsPclbJIhwHnAMkSun9Xhj5us71KYSFXWc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bQ0/lUy1Py46ww8vLlXpUQD7KxDDubrdROJiwTjWBt4gh1C4Gwqi/P/l/ACJQeZf5
	 XsuVMJDHKe1NFfRhx8dfEhWF9zUaKILinjDB87OW8SdVZv67+GMwHBvTDIlu3rIvCo
	 ++PhADG2c3+4dHPc6k85YHLCr6n2fWcku2n3Ez8o=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OLq29c116849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 May 2021 16:52:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 16:52:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 16:52:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OLq1fw015051;
	Mon, 24 May 2021 16:52:01 -0500
Date: Mon, 24 May 2021 16:52:01 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH V2] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210524215201.72svjoseh6mjvuxg@turbojet>
References: <20210524202608.24622-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210524202608.24622-1-yogeshs@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:26-20210524, Yogesh Siraswar wrote:
> Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> compile dtbs with symbols. This fixes the issue where the dtbs
> are build without symbols causing issue with overlays.

Might be worthwhile to add that enabling overlay support increases the
size of the dtb, hence it is done at a platform level rather than
globally to allow custom boards derived from meta-ti to not pay the
penalty of extra dtb size, yet have the flexibility to enable on need
basis.

> 
> Changes from last version:
> 1) Added human readable flag KERNEL_DTB_OVERLAY_SUPPORT to control
> DTC_FLAGS.
> 2) The KERNEL_DTB_OVERLAY_SUPPORT is also derived from build-root
> usage.

Please don't add change log of patch version in commit message. That is
not an information that is useful in git history.

> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/am335x-evm.conf                  | 2 ++
>  conf/machine/am335x-hs-evm.conf               | 2 ++
>  conf/machine/am437x-evm.conf                  | 2 ++
>  conf/machine/am437x-hs-evm.conf               | 2 ++
>  conf/machine/am57xx-evm.conf                  | 2 ++
>  conf/machine/am57xx-hs-evm.conf               | 3 +++
>  conf/machine/am65xx-evm.conf                  | 2 ++
>  conf/machine/am65xx-hs-evm.conf               | 2 ++
>  conf/machine/dra7xx-evm.conf                  | 2 ++
>  conf/machine/dra7xx-hs-evm.conf               | 3 +++
>  conf/machine/j7-evm.conf                      | 2 ++
>  conf/machine/j7-hs-evm.conf                   | 2 ++
>  conf/machine/j7200-evm.conf                   | 2 ++
>  conf/machine/k2g-evm.conf                     | 2 ++
>  conf/machine/k2g-hs-evm.conf                  | 2 ++
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
>  recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
>  18 files changed, 49 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/ti-kernel.inc
> 
> +

[...]

> +def get_extra_dtc_args(d):
> +    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
> +        return "DTC_FLAGS=-@"
> +    else:
> +        return ""
> +
> +EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
> -- 
> 2.17.1
> 

just for the record for other bb files:
linux-ti-staging-rt_5.10.bb linux-ti-staging-systest_5.10.bb 

I think this opens up other possibilities in the future to move common
operations into ti-kernel.inc and probably drop duplications

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
