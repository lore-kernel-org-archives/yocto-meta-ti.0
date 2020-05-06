Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.4171.1588782475747429618
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bx+YHW0S;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046GRs6l116257;
	Wed, 6 May 2020 11:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588782474;
	bh=CE/UEjyagEPicVJG655IgBJ+ssyoqXnkH2eaLY/nb2w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bx+YHW0SmIKzTQoABg5kuTPHeL6uQJo5IzpJtZ95ETksR2SJdRSZ3zFXk8JNQLqo+
	 FSq2GhppXi2URIpNJDhAJrzCb0ZS7+l7u0YMFNqkVhzXiSI6D5nVYZKkVB01AaaqNH
	 xvReQtqYpcNtUqtAh8wAwN7hfoLkvO3nzTt3nrTk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046GRs3f017616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 May 2020 11:27:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 11:27:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 11:27:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046GRsmD129991;
	Wed, 6 May 2020 11:27:54 -0500
Date: Wed, 6 May 2020 12:27:54 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <nikhil.nd@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
Message-ID: <20200506162753.GQ2849@beryl>
References: <20200506153803.11083-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200506153803.11083-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nikhil,

This has already been merged over a week ago:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=baa7ddff0d030f228f55483da76a4ad8d4a205c8

Denys


On Wed, May 06, 2020 at 09:08:03PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> rpmsg_kdrv_switch kernel module is implicitly dependent on the
> for virtual ethernet driver. Ensure that the module is auto loaded
> by default foe j7-evm platfom.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_5.4.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index ecf72af9..1ec2a2fd 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -74,6 +74,7 @@ SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>  
>  FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
>  
> +KERNEL_MODULE_AUTOLOAD_append_j7-evm = " rpmsg_kdrv_switch"
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> -- 
> 2.17.1
> 
