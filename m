Return-Path: <koansoftware@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB4CFEE4F1
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 15:54:30 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.121125.1772294060482907121
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 28 Feb 2026 07:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TkE2h6Ri;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: koansoftware@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb20bcff5aso300467685a.3
        for <meta-ti@lists.yoctoproject.org>; Sat, 28 Feb 2026 07:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772294059; x=1772898859; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1MWotnvpKf+aiy3Vo7UmnOcjlzzgeVMEtia4RFYtnQ=;
        b=TkE2h6RiB6BoGcKNE60dDgARMhLPo76732DZJymO5jNWbTr9/hZnAorUaBqU/UWlb+
         4jlKYc9ioqDlVOsGhMNJL2J5u48qeRkBIx1HCnArxf1Q0E4g1RkF7L3U74a12LDA6G1z
         +E8+2+n6jDIff5g6V0S2jZN4YWguqEQaFQy/7s4QfNZcYYBjCzqKyo0nX8jmGrt9DX6Y
         w1t0RK/1CLcagp8P3ZpojJOlUjj+14dXSRNRDiOoSJqRxlBBaynDO0pvyZRzwbHZ68nA
         bay15pY0kynJLL0fHHejiznIhC+0xPXyLirpz8MxYEw53C6MpWLTM4uDsqFUk7AymU0g
         YXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772294059; x=1772898859;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1MWotnvpKf+aiy3Vo7UmnOcjlzzgeVMEtia4RFYtnQ=;
        b=wsrAUiRfCyu063nDZUzznA1O2VCgl3Wt/EvgdXT2TiNgfMkI9Cx/kgv9n55z67WNAJ
         C3ochCyCk9Ax0mE2xSMZ9Ghob0+EmYc/VNW9/U6T0RsEAtKeHti4KRMgzuoxXcTVmJkC
         ArkcWupGaOU6kHamK1PTD1UsJaSz/+OaFORaDAavc40O+cDBuv5LnS17rZkyJYT6uEzH
         DSFEfPfs6RgZGi+V5nHV1ZOpznspcp2vmgyG2yFLAvLGn574FBRSrugiEI39KuQhy89P
         y3MmruPt3FAhz1yFKcbjpkH+EYLac/HTQ/g3DdNGnLFco9siXfWPPQeFr1Il9RDpjekF
         ewdA==
X-Gm-Message-State: AOJu0YxMGZAF2hcAPtrjzZBjY+sKLnM4OThOVmdEiiS/YMj/47Dt4yXF
	NDKIL8j/h0+0Y/Ul8iAVs4crvHCdbi3K4+7tw4CXXEW+hq3YwGwlX/XSIX4XmA==
X-Gm-Gg: ATEYQzwEMNhX9RgEo0Ub1xkVFeTTfyQT01K1yIqLEAhg0CxBbxZpADKi4eaZADuapeD
	VDtEgAwKPXIt1bGVxDBAFo0bO5clkcGrc2+r9/CVOu8Mt4G/wsFoqxdnTZiMlaoAfzdzDZ9Cz9E
	KO964g4VXnAIiQyP8RtJajpYxCAYvgGu7xd1BmiW0BBOuhDTfWhIEKi6Kr4FEjgKux/nYwNuTgi
	tpG2UmQqkzzxI1/uuBoQebxT9dQl7OGI1UoRmTK789xXQYrjcW+aMLaaDk04Ahqf2Cdef7mO7Jo
	/2kgvOlUn8NzTQhKwH9u/8qmBr/Pck6zsDV921m0lEgu6x+TUrPjCx/DwvczxE8jY8hiSE59mvh
	RTINDNXStTH8N+bZXd+jY0GIzgbSxwSlR5AUGmgv1pHT5E+U5BgM9NST/sZ+k3RnLfA+FdvVUZ9
	GlxBMV8Kk5jBFGCkmfZTRZmwIhuLX+tk4WlHqrxw3krLSTiqg6ggS6HpC4Y3RMXMweBudy1RTV3
	2A=
X-Received: by 2002:a05:620a:1708:b0:8cb:52e0:15dd with SMTP id af79cd13be357-8cbc8e32950mr805791785a.73.1772294058645;
        Sat, 28 Feb 2026 07:54:18 -0800 (PST)
Received: from [192.168.0.6] (host-95-229-48-41.business.telecomitalia.it. [95.229.48.41])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8cbbf6541f1sm720409185a.3.2026.02.28.07.54.17
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 07:54:18 -0800 (PST)
Message-ID: <889c1f8a-58fa-4008-918c-100850791b6e@gmail.com>
Date: Sat, 28 Feb 2026 16:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: koansoftware@gmail.com
Content-Language: it-IT, en-US
To: meta-ti@lists.yoctoproject.org
From: Marco <koansoftware@gmail.com>
Subject: HDMI problems using Yocto scarthgap with BBB Rev.D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 28 Feb 2026 15:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19623

Hello,
I am using Yocto scarthgap with BBB Rev.D

I am facing to errors at boot and I am wondering if anyone else have the 
same issue and/or can tell me how to solve it.

Is the Rev.D properly supported by meta-ti or is a testing revision?


Retrieving file: /extlinux/extlinux.conf
1:	Poky (Yocto Project Reference Distro)
Retrieving file: /extlinux/../zImage
append: root=/dev/mmcblk0p2 rootwait rw earlycon 
console=ttyO0,115200n8,115200
Retrieving file: /extlinux/../am335x-boneblack-revd.dtb

Starting kernel ...

[    0.000000] Linux version 6.12.34-ti (oe-user@oe-host) 
(arm-poky-linux-gnueabi-gcc (GCC) 13.4.0, GNU ld (GNU Binutils) 
2.42.0.20240723) #1 SMP PREEMPT Thu Jul 17 16:44:09 UTC 2025
...
[    0.409281] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    0.428478] 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: 
Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
[    0.448223] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with /connector-hdmi
[    0.461485] /connector-hdmi: Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
...
[    3.412613] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.435931] remoteproc remoteproc0: wkup_m3 is available
[    3.446099] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.476974] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.496475] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.583419] 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: 
Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
...
[    3.858281] sdhci-omap 481d8000.mmc: supply pbias not found, using 
dummy regulator
[    3.867253] sdhci-omap 481d8000.mmc: supply vqmmc not found, using 
dummy regulator
[    3.877353] 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: 
Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
[    3.905028] 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: 
Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
[    3.923957] 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c: 
Fixed dependency cycle(s) with 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.942129] 
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0: 
Fixed dependency cycle(s) with 
/ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/bridge-hdmi@4c
[    3.973781] ------------[ cut here ]------------
[    3.978610] WARNING: CPU: 0 PID: 35 at 
/drivers/gpu/drm/drm_atomic_state_helper.c:174 
drm_atomic_helper_crtc_duplicate_state+0x68/0x70
[    3.991114] Modules linked in:
[    3.994306] CPU: 0 UID: 0 PID: 35 Comm: kworker/u4:2 Not tainted 
6.12.34-ti #1
[    3.994324] Hardware name: Generic AM33XX (Flattened Device Tree)
[    3.994336] Workqueue: events_unbound deferred_probe_work_func
[    3.994372] Call trace:
[    3.994384]  unwind_backtrace from show_stack+0x18/0x1c
[    3.994426]  show_stack from dump_stack_lvl+0x54/0x68
[    3.994460]  dump_stack_lvl from __warn+0x84/0x154
[    3.994485]  __warn from warn_slowpath_fmt+0x180/0x1fc
[    3.994502]  warn_slowpath_fmt from 
drm_atomic_helper_crtc_duplicate_state+0x68/0x70
[    3.994522]  drm_atomic_helper_crtc_duplicate_state from 
drm_atomic_get_crtc_state+0x70/0x110
[    3.994560]  drm_atomic_get_crtc_state from 
drm_atomic_helper_disable_all+0x98/0x1d0
[    3.994581]  drm_atomic_helper_disable_all from 
drm_atomic_helper_shutdown+0x98/0x14c
[    3.994597]  drm_atomic_helper_shutdown from tilcdc_fini+0x58/0xd0
[    3.994618]  tilcdc_fini from tilcdc_init.constprop.0+0x1dc/0x60c
[    3.994635]  tilcdc_init.constprop.0 from tilcdc_pdev_probe+0x58/0xac
[    3.994652]  tilcdc_pdev_probe from platform_probe+0x64/0xb8
[    3.994673]  platform_probe from really_probe+0xd8/0x3ac
[    3.994696]  really_probe from __driver_probe_device+0x94/0x11c
[    3.994720]  __driver_probe_device from driver_probe_device+0x38/0xc8
[    3.994739]  driver_probe_device from __device_attach_driver+0xa0/0x114
[    3.994752]  __device_attach_driver from bus_for_each_drv+0x98/0xec
[    3.994771]  bus_for_each_drv from __device_attach+0xb0/0x1d0
[    3.994788]  __device_attach from bus_probe_device+0x90/0x94
[    3.994807]  bus_probe_device from device_add+0x4a4/0x69c
[    3.994829]  device_add from of_platform_device_create_pdata+0xa0/0xf8
[    3.994868]  of_platform_device_create_pdata from 
of_platform_bus_create+0x1b4/0x31c
[    3.994893]  of_platform_bus_create from of_platform_populate+0x80/0x120
[    3.994919]  of_platform_populate from sysc_probe+0x4d4/0x6f4
[    3.994956]  sysc_probe from platform_probe+0x64/0xb8
[    3.994975]  platform_probe from really_probe+0xd8/0x3ac
[    3.994995]  really_probe from __driver_probe_device+0x94/0x11c
[    3.995020]  __driver_probe_device from driver_probe_device+0x38/0xc8
[    3.995038]  driver_probe_device from __device_attach_driver+0xa0/0x114
[    3.995052]  __device_attach_driver from bus_for_each_drv+0x98/0xec
[    3.995070]  bus_for_each_drv from __device_attach+0xb0/0x1d0
[    3.995087]  __device_attach from bus_probe_device+0x90/0x94
[    3.995105]  bus_probe_device from device_add+0x4a4/0x69c
[    3.995126]  device_add from of_platform_device_create_pdata+0xa0/0xf8
[    3.995149]  of_platform_device_create_pdata from 
of_platform_bus_create+0x1b4/0x31c
[    3.995174]  of_platform_bus_create from of_platform_populate+0x80/0x120
[    3.995199]  of_platform_populate from simple_pm_bus_probe+0xd4/0x11c
[    3.995223]  simple_pm_bus_probe from platform_probe+0x64/0xb8
[    3.995242]  platform_probe from really_probe+0xd8/0x3ac
[    3.995262]  really_probe from __driver_probe_device+0x94/0x11c
[    3.995286]  __driver_probe_device from driver_probe_device+0x38/0xc8
[    3.995305]  driver_probe_device from __device_attach_driver+0xa0/0x114
[    3.995318]  __device_attach_driver from bus_for_each_drv+0x98/0xec
[    3.995336]  bus_for_each_drv from __device_attach+0xb0/0x1d0
[    3.995354]  __device_attach from bus_probe_device+0x90/0x94
[    3.995372]  bus_probe_device from device_add+0x4a4/0x69c
[    3.995393]  device_add from of_platform_device_create_pdata+0xa0/0xf8
[    3.995416]  of_platform_device_create_pdata from 
of_platform_bus_create+0x1b4/0x31c
[    3.995441]  of_platform_bus_create from of_platform_populate+0x80/0x120
[    3.995466]  of_platform_populate from simple_pm_bus_probe+0xd4/0x11c
[    3.995489]  simple_pm_bus_probe from platform_probe+0x64/0xb8
[    3.995508]  platform_probe from really_probe+0xd8/0x3ac
[    3.995527]  really_probe from __driver_probe_device+0x94/0x11c
[    3.995552]  __driver_probe_device from driver_probe_device+0x38/0xc8
[    3.995570]  driver_probe_device from __device_attach_driver+0xa0/0x114
[    3.995584]  __device_attach_driver from bus_for_each_drv+0x98/0xec
[    3.995602]  bus_for_each_drv from __device_attach+0xb0/0x1d0
[    3.995619]  __device_attach from bus_probe_device+0x90/0x94
[    3.995637]  bus_probe_device from device_add+0x4a4/0x69c
[    3.995659]  device_add from of_platform_device_create_pdata+0xa0/0xf8
[    3.995681]  of_platform_device_create_pdata from 
of_platform_bus_create+0x1b4/0x31c
[    3.995707]  of_platform_bus_create from of_platform_populate+0x80/0x120
[    3.995731]  of_platform_populate from simple_pm_bus_probe+0xd4/0x11c
[    3.995755]  simple_pm_bus_probe from platform_probe+0x64/0xb8
[    3.995773]  platform_probe from really_probe+0xd8/0x3ac
[    3.995793]  really_probe from __driver_probe_device+0x94/0x11c
[    3.995817]  __driver_probe_device from driver_probe_device+0x38/0xc8
[    3.995836]  driver_probe_device from __device_attach_driver+0xa0/0x114
[    3.995849]  __device_attach_driver from bus_for_each_drv+0x98/0xec
[    3.995867]  bus_for_each_drv from __device_attach+0xb0/0x1d0
[    3.995885]  __device_attach from bus_probe_device+0x90/0x94
[    3.995902]  bus_probe_device from deferred_probe_work_func+0xa4/0xe8
[    3.995926]  deferred_probe_work_func from process_one_work+0x190/0x450
[    3.995963]  process_one_work from worker_thread+0x1c0/0x360
[    3.995987]  worker_thread from kthread+0xf8/0x110
[    3.996014]  kthread from ret_from_fork+0x14/0x28
[    3.996032] Exception stack(0xe0095fb0 to 0xe0095ff8)
[    3.996043] 5fa0:                                     00000000 
00000000 00000000 00000000
[    3.996054] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    3.996064] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.996073] ---[ end trace 0000000000000000 ]---
[    4.534022] tilcdc 4830e000.lcdc: [drm] *ERROR* Disabling all crtc's 
during unload failed with -12


Thank you
--
Marco

