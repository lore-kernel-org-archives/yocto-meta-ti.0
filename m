Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.323.1588872819308986615
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 May 2020 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EMFR/jEi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 047HXbxX126408;
	Thu, 7 May 2020 12:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588872817;
	bh=oUamsNtdr3i/aDiX+dcMEGFU/TSXxU4zsEhf8eAMLj8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EMFR/jEiPDmtt8udEiI8TJcD8haznGhzSZXS/VgWwb6Nca7EhwcDstD7BiAptdtGF
	 BDv+1KSTEINxEVYHKypQ2MrkuNhKU9bzgL2ZimXG7XhGQtH0R590p5BaOOXBxX558x
	 EZXsfF57TztZc633D4G+wzvQirZzaCwf0Dv4wFUQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 047HXb37008203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 May 2020 12:33:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 May
 2020 12:33:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 May 2020 12:33:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 047HXbuu003864;
	Thu, 7 May 2020 12:33:37 -0500
Date: Thu, 7 May 2020 13:33:37 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
Message-ID: <20200507173336.GT12015@beryl>
References: <20200506153803.11083-1-nikhil.nd@ti.com>
 <20200506162753.GQ2849@beryl>
 <d18ae6fb6b5f471e8ac281b3e56110e8@ti.com>
MIME-Version: 1.0
In-Reply-To: <d18ae6fb6b5f471e8ac281b3e56110e8@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 07, 2020 at 01:22:50AM -0400, Devshatwar, Nikhil wrote:
> Hi Denys,
> 
> I was expecting a merge to zeus as well.
> What branches are we using for the coresdk release?

dunfell


> Regards,
> Nikhil D
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, May 6, 2020 9:58 PM
> To: Devshatwar, Nikhil
> Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
> 
> Nikhil,
> 
> This has already been merged over a week ago:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=baa7ddff0d030f228f55483da76a4ad8d4a205c8
> 
> Denys
> 
> 
> On Wed, May 06, 2020 at 09:08:03PM +0530, nikhil.nd@ti.com wrote:
> > From: Nikhil Devshatwar <nikhil.nd@ti.com>
> > 
> > rpmsg_kdrv_switch kernel module is implicitly dependent on the
> > for virtual ethernet driver. Ensure that the module is auto loaded
> > by default foe j7-evm platfom.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_5.4.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> > index ecf72af9..1ec2a2fd 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> > @@ -74,6 +74,7 @@ SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> >  
> >  FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> >  
> > +KERNEL_MODULE_AUTOLOAD_append_j7-evm = " rpmsg_kdrv_switch"
> >  # Special configuration for remoteproc/rpmsg IPC modules
> >  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
> >  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> > -- 
> > 2.17.1
> > 
