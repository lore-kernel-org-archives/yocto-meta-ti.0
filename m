Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82379E00DD7; Wed, 24 Jul 2019 11:52:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D2C4E00D90;
	Wed, 24 Jul 2019 11:52:02 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OIq0WZ071696;
	Wed, 24 Jul 2019 13:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563994320;
	bh=SIJI1yyhQpYfR+5MECYVRa5PxtjbcFQhDt0cxQnvRYs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q0ByU/hU4pOvxBZqK8fQEzcrd+SFrWRYX8ppbI4mZKBNw6IvXDqQZFahF2HVbaCHm
	D348712qcNpHXVILuDv322eb4K0IwfI38X9rUE2e+r45Ci8YpkP7g3OPJXHPUCg1W1
	ET1WWvNneUvmE+N/m1Q5jmzAS3qdLi2p9sK1Tyhs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OIq0SC130837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jul 2019 13:52:00 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 13:51:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 13:51:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OIpxwm026853;
	Wed, 24 Jul 2019 13:51:59 -0500
Date: Wed, 24 Jul 2019 14:51:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Andy Pont <andy.pont@sdcsystems.com>
Message-ID: <20190724185159.GD5700@beryl>
References: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
MIME-Version: 1.0
In-Reply-To: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, Yocto-mailing-list <yocto@yoctoproject.org>
Subject: Re: Building for AM335x with meta-ti and meta-qt5
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
X-List-Received-Date: Wed, 24 Jul 2019 18:52:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 24, 2019 at 05:53:36PM +0000, Andy Pont wrote:
> I am trying to build a Yocto (warrior) image for the AM335x using meta-ti
> and meta-qt5 that will render directly to the GPU.  Initially this will be
> for the Beaglebone Black but then ultimately will be for a custom hardware
> platform.
> 
> In broad outline, I think, the software stack needs to look a bit like:
> 
> Qt Application
> QtBase, QtWebEngine, etc.
> Qt-OpenGL
> ti-sgx-ddk
> AM335x GPU
> 
> I have included meta-ti and meta-qt5 into my belayers.conf and added
> ti-sgx-ddk-km, ti-sgx-ddk-um, qtbase and qtwebengine to
> IMAGE_INSTALL_append.  When I try to bitbake core-image-minimal I start to
> get a failure to compile ti-sgx-ddk-km with a number of, what appear to be,
> warnings of the form:
> 
> KBUILD_EXTRA_SYMBOLS=
> | grep: /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/amba:
> Is a directory
> | grep: /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/avf:
> Is a directory
> 
> It then ultimately appears to give up with:
> 
> | ******* Multiarch build: no
> | ******* Primary arch:    target_armel
> | ******* Secondary arch:  none
> | ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may
> fail.
> | eurasiacon/build/linux2/toplevel.mk:230:
> eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or
> directory
> 
> Is there a specific kernel I need to define in local.conf that the GPU
> drivers build against?
> 
> Also, is there any specific configuration I need to do in order to get Qt to
> use the SGX OpenGL drivers?

What's your DISTRO, your MACHINE, TUNES and any other special configs?


> I have had a search on the web but not found anything for recent Yocto
> versions, only very old stuff.

It's been working fine for years, hence no recent discussions. You may want to 
look into TI Processor SDK for AM335x - it's Yocto Project based Arago distro 
that is configured for Qt5-Wayland/Weston-SGX, but has been also tested with 
EGLFS QPA.

-- 
Denys

