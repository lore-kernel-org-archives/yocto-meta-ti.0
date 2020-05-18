Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2718.1589830257549601325
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 May 2020 12:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qnjb+x9c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04IJUuV3054435;
	Mon, 18 May 2020 14:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589830256;
	bh=3gu0kYFi9xt3dLXp9shfT9Fmr9+QPWnU+gbtFvsV2kc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Qnjb+x9c8fuygm+VsmnsHDYRXK70II3L3VOfNSGgabdpem9FVgI9VhrGSEzx9g/O2
	 +yDzqypXtkVaAXrqcYeQv3su5fVY+gR5qDNIHFbGGR+ObAgQnlNRdWN4WPeAg/LiJL
	 pJgwrh1zpkOfqTK/H75/gDSaKLQyRf0JmsHe2PAc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04IJUuFU073870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 May 2020 14:30:56 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 14:30:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 14:30:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04IJUtpK070049;
	Mon, 18 May 2020 14:30:55 -0500
Date: Mon, 18 May 2020 15:30:55 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Luca <magnabosco.luca@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
Message-ID: <20200518193055.GE26065@beryl>
References: <f734db2d-fd0b-cab1-9d37-54c3c3b49b70@ti.com>
 <16879.1589829559511127279@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16879.1589829559511127279@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 18, 2020 at 12:19:19PM -0700, Luca wrote:
> Hi Andrew,
> 
> thanks a lot for the clarifications and updated info.
> It seems I was relaying on outaded and/or incomplete info.
> 
> > 
> > libgbm is a virtual as it has multiple optional providers, one of which
> > is ti-sgx-ddk-um, our standalone libgbm has been deprecated, use the one
> > provided by ti-sgx-ddk-um:
> 
> > 
> > PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
> > 
> 
> Perfect, thanks. I was just starting to understand that the standalone 
> libgbm has been deprecated reading 
> http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components/Graphics/Migration_From_Prior_Releases.html#from-processor-sdk-6-1-to-6-2-for-am3-4-5-6
> 
> > 
> > EGL provides window system (x11, wayland, gbm, surfaceless) integration
> > for both GL and GLES (and OpenVG), but our EGL implementation only
> > supports GLES, as that is all our GPUs support (at least on AM335x).
> > Full desktop GL would have to be done using SW rendering, which is
> > probably not what you want.
> 
> I understood that full GL would have been done using SW rendering, but I 
> thought it was the only way to get Weston working.
> 
> > 
> > So my question back is then, why are you trying to pull in 'mesa' and/or
> > 'mesa-gl'? Weston works fine with the stack we provide in ti-sgx-ddk-um.
> > 
> 
> Your question is very legitimate.
> I was pulling mesa-gl just to fulfil Weston dependencies, but thank to your 
> info I now understand that I was doing it the wrong way.
> Then the question is:
> How should I set the providers to get Weston working fine with ti-sgx-ddk-um?

Weston does not require mesa or mesa-gl.

Your distro should set all PREFERRED_PROVIDERs and DISTRO_FEATURES properly.

E.g. Arago Project distro in meta-arago, used by TI Processor SDKs does:

PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"

DISTRO_FEATURES_remove = "x11"
DISTRO_FEATURES_append = " wayland opengl"

-- 
Denys
