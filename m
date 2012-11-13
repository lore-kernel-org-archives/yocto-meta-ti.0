Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3F9DE0032E
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 07:15:30 -0800 (PST)
Received: from [192.168.0.2] (host81-153-112-132.range81-153.btcentralplus.com
	[81.153.112.132]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 760279BE3
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 15:15:29 +0000 (GMT)
Message-ID: <50A26410.5030405@r-finger.com>
Date: Tue, 13 Nov 2012 15:15:28 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
In-Reply-To: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 15:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13/11/12 13:46, Flavio Castro Alves Filho wrote:
> Hello all,
> 
> I'm using Yocto Project and meta-ti to build an embedded Linux distribution
> for BeagleBoard-xM.
> 
> I need to add gstreamer-ti into the project, and I'm having problems in
> building this package with my configuration.
> 
> NOTE: package ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task
> do_fetch: Started

My guess would be that your layers are not set up correctly, you can see
in the error output that the ${MACHINE_KERNEL_PR} variable is not
getting expanded; this is defined in omap3.inc in meta-ti, which would
be included from the meta-ti beagleboard.conf, but the way the layers
are set up leads to the yocto beagleboard.conf being used instead.

For Denzil it is not possible to arrange meta-yocto and meta-ti layers
in a way that would work; this has been fixed in Danny (in
meta-yocto-bsp). If you want to stick with Denzil, there are different
ways to work around it, easiest should be to delete the offending
beagleboard.conf from meta-yocto.

(If you are providing your own distro layer, and the layer is set up to
prefix itself to the BBPATH, you can provide your own beagleboard.conf
that sources the correct one from meta-ti, something like this,
https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/conf/machine/beagleboard.conf).

Tomas


