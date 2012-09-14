Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (unknown [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12D26E01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 03:27:04 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-86-254.range81-153.btcentralplus.com
	[81.153.86.254]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 3E8149ADE
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 11:26:35 +0100 (BST)
Message-ID: <5053065A.4090009@r-finger.com>
Date: Fri, 14 Sep 2012 11:26:34 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20120914080805.GD26968@edge>
In-Reply-To: <20120914080805.GD26968@edge>
Subject: Re: Make meta-ti comply with Yocto Project BSP requirements
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
X-List-Received-Date: Fri, 14 Sep 2012 10:27:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/12 09:08, Denys Dmytriyenko wrote:
> 3. Inheriting (i.e. inherit systemd) classes from another layer, such as 
> meta-systemd. This behavior breaks parsing and requires BBMASK-ing those 
> problematic recipes. Although, it requires an "application" layer and not a 
> "distribution" one, it's quite bad nonetheless, as it breaks parsing. High 
> priority.

I am not sure about this one; it is reasonable / necessary for a bsp
layer to provide an -initd / -systemd packages (e.g., the pvr drivers
need this, the gstreamer-ti package needs this), and as long as there is
no systemd.bbclass in oe-core, I suspect the only answer is to split the
bsp layer into -bsp, -bsp-initd and --bsp-systemd. I am not sure whether
such endless proliferation of layers is a particularly good solution?

Tomas

