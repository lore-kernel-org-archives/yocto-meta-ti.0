Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27AC7E00B65; Fri,  2 Aug 2019 17:10:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C829DE00B31
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 17:10:26 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id m23so74280342lje.12
	for <meta-ti@yoctoproject.org>; Fri, 02 Aug 2019 17:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XcJtQHHwq0WJ2nlCgzhBDJXArsmQmlElifL6Diximvs=;
	b=as4lEZjdqR2qVZAWkRJLiVmBicaDFjbxJHLg0T9knLCbVq6uiyZCjBSUrLcN9Tdgsl
	V8znR+pzg4xHdyxA/wTufh0G/iMS1cjP3LWiSzZn38/XvV3qlkLFYEVP5kfK6IRPscRb
	73CPniBrgKA80fWwrkWj6j3rsbZE/zaCZP6u/oYF+2oKVP8LM5Ms9G4tf2snz4IcoH+I
	LQlIQsR2uPh7/1sKCBoDWTw4cJga0OtUIGMjDC4ZuxGUZ3RDE78a8KeiZUlzqBRHNXcy
	XMlgTzHUpZKlIKOljjUbORfXj05PfFt9goiKq4g4LcKxKVFT9vZ2cgknIo6Hhdkc+Z+z
	eW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XcJtQHHwq0WJ2nlCgzhBDJXArsmQmlElifL6Diximvs=;
	b=Ru8VBrDJm8v/Bs7DWcLfC8TDGWtQmjrXd66s28CpTVixUG63JIeT5UV0+mgGVAA/aj
	ARHtOJMdSTqphFJpTF7KdnHWnil5JGRMOoS8to8mN8MXO6otex0BuqBsM97kd9P4PzQQ
	Frvj7Yvm+mzfkSRIOY45mE38y/BGnY5Prh2eqo7ltSPrm7THMeWc+6vpD2x1wQKS10HJ
	h3VRGkrrxbvzZskudqqqt2dKe0w4SY8yEpZHZbNsKJYWDZJJu0n4JO0n0ngtVhSgpzny
	iOx7BXygIiMPj/f7/rwBQmpXj996Y8fXYx2IjAUOt1gHb7e39IZ6W5JRDER/uUobxdrk
	p9wg==
X-Gm-Message-State: APjAAAUKcWqW+JTXdUs+PS7GKD/UEjjuPGemPWZFQtobIUVvKK/kitCn
	44iEd8CJnWzDJN1YyPSPrnt2EWY8GIIUhjH3d08=
X-Google-Smtp-Source: APXvYqzPiEApwhBvLya+mNqZDp02NZxndKh7dar37bnzXcVuFz3MrU8l3gW97dMMf6FxQmFoHc4YqSABvInM2swsiJs=
X-Received: by 2002:a2e:a415:: with SMTP id p21mr1934034ljn.111.1564791025402; 
	Fri, 02 Aug 2019 17:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190802233401.26778-1-jbergsagel@ti.com>
In-Reply-To: <20190802233401.26778-1-jbergsagel@ti.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 3 Aug 2019 12:10:14 +1200
Message-ID: <CADySD0EWbPA1+Rauwd=c3mWMJ=kdawoZ4nS+TwF+TGpLR=UQyA@mail.gmail.com>
To: Jonathan Bergsagel <jbergsagel@ti.com>
Cc: meta-ti@yoctoproject.org, Santosh Jha <sjha@ti.com>,
	Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v3] ipc-lld: add AM65xx IPC echo_test firmware binaries
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
X-List-Received-Date: Sat, 03 Aug 2019 00:10:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 11:36 AM Jonathan Bergsagel <jbergsagel@ti.com> wrote:
>
> Use IPC/LLD based IPC echo test binaries as an
> alternative for AM65X Linux IPC testing.
> Updated location of J721E firmware binaries as well,
> with latest IPC/LLD commit.
>
> Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
> ---
>  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb | 198 ++++++++++++++++----------
>  1 file changed, 124 insertions(+), 74 deletions(-)
>
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> index f8157d8c6e5b..4c8743d021f3 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> @@ -6,67 +6,79 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
>  inherit deploy
>  inherit update-alternatives
>
> +COMPATIBLE_MACHINE = "k3"
> +
>  PV = "1.0-git${SRCPV}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRCREV = "66764a5f063db606ea9db23380694bfd7d4aeafb"
> +SRCREV = "81392da08fab2b5cfc23d63dbe71b7244a6af477"
>
>  SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
>
>  S = "${WORKDIR}/git"
>
> -R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries"
> +AM65X_R5_FW_DIR = "${S}/examples/echo_test/binaries/am65xx"
> +J721E_R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries/j721e"

Wouldn't it be nice to use machine overrides over here as well?
R5_DSP_FW_DIR_am65xx = "${S}/examples/echo_test/binaries/am65xx"
R5_DSP_FW_DIR_j7-evm = "${S}/examples/echo_test/binaries/j721e"

> +
> +PLATFORM_am65xx = "am65xx"
> +PLATFORM_j7-evm = "j7-evm"
>
>  # make sure that lib/firmware, and all its contents are part of the package
>  FILES_${PN} += "${base_libdir}/firmware"
>
>  # install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>  do_install() {
> -  install -d ${D}${base_libdir}/firmware/pdk-ipc
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -d ${D}${base_libdir}/firmware/pdk-ipc
> +}
> +
> +do_install_append_am65xx() {
> +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +}
> +
> +do_install_append_j7-evm() {
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
>  }
>
> -TARGET_MCU_R5FSS0_0 = "j7-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1 = "j7-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0 = "j7-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1 = "j7-main-r5f1_1-fw"
> -TARGET_C66_0 = "j7-c66_0-fw"
> -TARGET_C66_1 = "j7-c66_1-fw"
> -TARGET_C7X = "j7-c71_0-fw"
> -ALTERNATIVE_${PN} = "\
> +# Set up names for the firmwares
> +ALTERNATIVE_am65xx = "\
> +                    am65x-mcu-r5f0_0-fw \
> +                    am65x-mcu-r5f0_1-fw \
> +                    "
> +ALTERNATIVE_j7-evm = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -77,6 +89,25 @@ ALTERNATIVE_${PN} = "\
>                      j7-c66_1-fw \
>                      j7-c71_0-fw\
>                      "
> +
> +# Set up link names for the firmwares
> +
> +TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
> +
> +TARGET_MCU_R5FSS0_0_j7-evm = "j7-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j7-evm = "j7-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j7-evm = "j7-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j7-evm = "j7-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_j7-evm = "j7-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_j7-evm = "j7-main-r5f1_1-fw"
> +TARGET_C66_0_j7-evm = "j7-c66_0-fw"
> +TARGET_C66_1_j7-evm = "j7-c66_1-fw"
> +TARGET_C7X_j7-evm = "j7-c71_0-fw"
> +
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> +
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -86,6 +117,12 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAI
>  ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
>  ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
>  ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
> +
> +# Create the firmware alternatives
> +
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
> +
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.strip.xer5f"
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
>  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.strip.xer5f"
> @@ -99,38 +136,51 @@ ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
>  ALTERNATIVE_PRIORITY = "10"
>
>  # copy the executables into the deploy directory
> -do_deploy () {
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
> -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
> +
> +do_deploy() {
> +    :
>  }
> +
> +do_deploy_am65xx() {
> +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> +}
> +
> +do_deploy_j7-evm() {
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
> +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
> +}
> +
>  addtask deploy after do_install before do_build
>
>  # This is used to prevent the build system to strip the executables
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

