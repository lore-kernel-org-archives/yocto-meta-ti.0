Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2D9CE01479
	for <meta-ti@yoctoproject.org>; Wed,  3 Jul 2013 08:44:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r63FiiXM031583;
	Wed, 3 Jul 2013 10:44:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r63FiitN015075;
	Wed, 3 Jul 2013 10:44:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 3 Jul 2013 10:44:44 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r63FiicO010683;
	Wed, 3 Jul 2013 10:44:44 -0500
Date: Wed, 3 Jul 2013 11:44:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nick G <exosyst+metaTI@gmail.com>
Message-ID: <20130703154443.GB8850@edge>
References: <CAN-pQATKnJkwjYkfW8Vu+SfdpXr67j4irpMyqTfKjeoeCdArLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN-pQATKnJkwjYkfW8Vu+SfdpXr67j4irpMyqTfKjeoeCdArLA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: License field in ti-hw-bringup-image
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
X-List-Received-Date: Wed, 03 Jul 2013 15:44:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 03, 2013 at 04:39:15PM +0100, Nick G wrote:
> I'm trying to build for the beaglebone using meta-ti and it returns an eror
> due to a license field not being set in ti-hw-bringup-image.
> 
> Could someone check what the license should be for the bb and set it?
> 
> I know you can cludge it by setting
> 
>  BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor)/" in local.conf but
> that doesn't really seem like a true fix.

It is a true fix. You do need to mask recipes-misc.

-- 
Denys

