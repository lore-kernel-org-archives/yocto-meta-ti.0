Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A704AE0059A
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 13:09:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2D003WEUO5Y520@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 12 Apr 2012 15:09:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 87EB420099; Thu,
	12 Apr 2012 16:09:41 -0400 (EDT)
Date: Thu, 12 Apr 2012 16:09:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120412200941.GF13291@denix.org>
References: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] am33x-cm3: add firmware for am33x suspend/resume
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 20:09:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Koen,

I'm commenting on both of your patches together...

am33x-cm3:
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> 
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware
> +	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
> +}


linux-ti33x-psp:
> This fixes most PM operations: cpufreq, cpuidle and suspend. Resume does not 
> work on beaglebone, but 3 out of 4 ain't bad :)
> 
> The M3 firmware needed for suspend/resume is used as a binary, building it 
> from source and including it from sysroots is planned for future commits.
> 
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> 
> +do_compile_prepend() {
> +       cp ${WORKDIR}/am335x-pm-firmware.bin ${S}/firmware/
> +}


Have you looked at how it's done in Arago/AM-SDK? The firmware is staged in 
the sysroots and gets picked up by the kernel:

do_install() {
    install -d ${STAGING_FIRMWARE_DIR}/am33x-cm3
    install ${S}/bin/am335x-pm-firmware.bin {STAGING_FIRMWARE_DIR}/am33x-cm3/
}

Where the kernel then copies it to ${S}/firmware:

# Copy the am33x-cm3 firmware if it is available
do_compile_prepend() {
    if [ -e "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" ]
    then
        cp "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" ${S}/firmware"
    fi
}

It's not the most elegant solution either, but at least it gets around the 
need to keep the binary version of the firmware in the repository with the 
kernel recipe...

Do you want me to make similar changes to your patches? Or do you have any 
arguments against this approach?

-- 
Denys

