Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AED09E002AC
	for <meta-ti@yoctoproject.org>; Mon, 18 Nov 2013 22:07:00 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJ66ski019804;
	Tue, 19 Nov 2013 00:06:54 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJ66sfE025546;
	Tue, 19 Nov 2013 00:06:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 00:06:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJ66raT021917;
	Tue, 19 Nov 2013 00:06:53 -0600
Date: Tue, 19 Nov 2013 01:06:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jithin Raj <jithin.raj@nestgroup.net>
Message-ID: <20131119060652.GN19813@edge>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
MIME-Version: 1.0
In-Reply-To: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
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
X-List-Received-Date: Tue, 19 Nov 2013 06:07:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 19, 2013 at 10:32:58AM +0530, Jithin Raj wrote:
> Hi ,
> 
>  
> 
> I am new to meta-ti.
> 
> 1) Does meta-ti (master) supports pandaboard(omap4) completely (graphics
> with sgx support). Because in the recipie-graphics/libgles these is only
> omap3 files ?

No graphics for omap4+ (yet) in meta-ti. There are recipes being worked out 
though.

-- 
Denys


> 2) In-order to support graphics in X11 (hardware graphics acceleration)
> I have used 
> 
>  
> 
>        XSERVER += "xserver-xorg \
> 
>            xserver-xorg-module-exa \
> 
>            xf86-input-evdev \
> 
>            xserver-xf86-config \
> 
>            xserver-xorg-extension-dbe \
> 
>            xserver-xorg-extension-dri \
> 
>            xserver-xorg-extension-dri2 \
> 
>            xserver-xorg-extension-extmod \
> 
>            xserver-xorg-extension-glx \
> 
>            xf86-input-mouse \
> 
>            xf86-input-keyboard \
> 
>            mesa-driver-swrast \
> 
>            xf86-video-omap"
> 
>  
> 
>        With these option when I run the application am getting a error :
> 
>  
> 
>        libEGL warning DRI2: failed to open omap (search paths
> /usr/lib/dri)
> 
>        PVRShell: EGL 1.4 Initialized
> 
>        PVRTTextureLoadFromPointer warning: PVRTC not supported.
> Converting to RGBA8888 instead.
> 
>        PVRTTextureLoadFromPointer warning: PVRTC not supported.
> Converting to RGBA8888 instead.
> 
>        PVRTTextureLoadFromPointer warning: PVRTC not supported.
> Converting to RGBA8888 instead.
> 
>        PVRTTextureLoadFromPointer warning: PVRTC not supported.
> Converting to RGBA8888 instead.
> 
>  
> 
>                 And the graphical application stucks screen after
> screen.
> 
>  
> 
> Experts please suggest.
> 
>  
> 
> Thanks in advance.
> 
>  
> 
> Thanks & regards
> 
> Jithin Raj
> 
>  
> 
> ***** Confidentiality Statement/Disclaimer *****
> 
> This message and any attachments is intended for the sole use of the intended recipient. It may contain confidential information. Any unauthorized use, dissemination or modification is strictly prohibited. If you are not the intended recipient, please notify the sender immediately then delete it from all your systems, and do not copy, use or print. Internet communications are not secure and it is the responsibility of the recipient to make sure that it is virus/malicious code exempt.
> The company/sender cannot be responsible for any unauthorized alterations or modifications made to the contents. If you require any form of confirmation of the contents, please contact the company/sender. The company/sender is not liable for any errors or omissions in the content of this message.
> 

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


