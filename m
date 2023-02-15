Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F19C05027
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 00:19:33 +0000 (UTC)
Received: from smtp1.emailarray.com (smtp1.emailarray.com [65.39.216.14])
 by mx.groups.io with SMTP id smtpd.web11.4260.1676420372379829987
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 16:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: balister.org, ip: 65.39.216.14, mailfrom: philip@balister.org)
Received: (qmail 73958 invoked by uid 89); 15 Feb 2023 00:19:31 -0000
Received: from unknown (HELO ?192.168.11.155?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3NS43NS45Ni4y) (POLARISLOCAL)  
  by smtp1.emailarray.com with SMTP; 15 Feb 2023 00:19:31 -0000
Message-ID: <9ec8378c-8663-5ce7-8c0a-295966a2989e@balister.org>
Date: Tue, 14 Feb 2023 19:19:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-ti] [kirkstone] beaglebone black usb not detected
Content-Language: en-US
To: danny@sizethreestudios.com,
 "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
References: <mail.63ec2436.2c80.7be571f74c4d27a6@storage.wm.amazon.com>
 <01000186526d7a6f-3205a832-0f36-4d03-9a6d-f4ae47c51575-000000@email.amazonses.com>
From: Philip Balister <philip@balister.org>
In-Reply-To: <01000186526d7a6f-3205a832-0f36-4d03-9a6d-f4ae47c51575-000000@email.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 00:19:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15847

Try brute adding all modules to the image by adding the kernel-modules 
package to the image. I had to this for my X15. And yes I need a less 
brute force solution, but this should give you an idea where the issue is.

Philip



On 2/14/23 19:15, Danny Hadley via lists.yoctoproject.org wrote:
> Hi folks! I am working on a Yocto build pipeline for a project targeting 
> the Beaglebone Black device and have been having some trouble getting 
> the kernel to detect USB devices attached to the USB port. I have a 
> suspicion this is somehow related to an incorrect configuration on my 
> end related to what kernel modules are loaded, but this is is a 
> relatively new field of development for me and am at a bit of a loss. I 
> have been able to confirm that the physical usb port itself is 
> functioning properly by printing the `usb tree` from a u-boot prompt, 
> where I am able to see some user-friendly information about the vendor 
> and product printed out.
> 
> 
> I haven't included much beyond what is provided out of the box by the 
> kirkstone branches of meta-ti, poky, meta-rauc, meta-oe, and meta-arm 
> layers; the majority of my build so far has been changes to `u-boot` to 
> help facilitate A/B update through rauc.
> 
> I've uploaded the output of some of what I believe are the best places 
> to help figure out what might be the problem to this gist:
> 
> https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303 
> <https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303>
> 
> The output there includes specific versions of the layers I have pulled 
> in, as well as the log output of the kernel boot, and the log output of 
> an interactive session in u-boot where I inspect the usb device tree.
> 
> It looks like this thread - 
> https://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html <https://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html>  - might be related to this issue but I wasn't exactly sure how to go about adding modules. I have tried creating a `linux-ti-staging_%.bbappend` file with the following contents:
> 
> ```
> FILESEXTRAPATHS:append := "${THISDIR}/files:"
> SRC_URI += " \
>      file://local_extra_config.cfg \
> "
> KERNEL_CONFIG_FRAGMENTS += " ${WORKDIR}/local_extra_config.cfg"
> 
> ```
> 
> where the `local_extra_config.cfg` file contains:
> 
> ```
> 
> CONFIG_USB=y
> CONFIG_USB_STORAGE=y
> CONFIG_USB_MASS_STORAGE=y
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> CONFIG_USB_OTG=y
> CONFIG_USB_XHCI_HCD=y
> CONFIG_USB_EHCI_HCD=y
> CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_SERIAL=y
> CONFIG_USB_SERIAL_CP210X=y
> CONFIG_USB_SERIAL_FTDI_SIO=y
> CONFIG_USB_SERIAL_PL2303=y
> CONFIG_USB_SERIAL_OPTION=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_ETH=y
> CONFIG_USB_G_NCM=y
> CONFIG_USB_GADGETFS=y
> CONFIG_USB_FUNCTIONFS=y
> CONFIG_USB_FUNCTIONFS_ETH=y
> CONFIG_USB_FUNCTIONFS_RNDIS=y
> CONFIG_USB_FUNCTIONFS_GENERIC=y
> CONFIG_USB_MASS_STORAGE=y
> CONFIG_USB_G_SERIAL=y
> CONFIG_USB_MIDI_GADGET=y
> CONFIG_USB_G_PRINTER=y
> CONFIG_USB_CDC_COMPOSITE=y
> CONFIG_USB_G_ACM_MS=y
> CONFIG_USB_G_MULTI=y
> CONFIG_USB_G_MULTI_CDC=y
> CONFIG_USB_G_HID=y
> CONFIG_USB_G_DBGP=y
> CONFIG_USB_G_WEBCAM=y
> 
> ```
> 
> But this did not solve my problem.
> 
> I would be happy to provide any additional information!
> 
> Thank you!
> 
> - Danny
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15846): https://lists.yoctoproject.org/g/meta-ti/message/15846
> Mute This Topic: https://lists.yoctoproject.org/mt/96973628/384425
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

