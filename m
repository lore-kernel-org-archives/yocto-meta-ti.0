Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94B77E00D86; Tue,  9 Jul 2019 21:13:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCC74E00C46
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2019 21:13:11 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id s22so841283qkj.12
	for <meta-ti@yoctoproject.org>; Tue, 09 Jul 2019 21:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=443jLebqKaIm9/GoHrFrZtcvDC8pOWNWdhmrfkKybkY=;
	b=C4rivRu3NxOPp38cju61UPO4USMyTsSEmdJkn2EaWsRW+CrsY5gY1SLqkyaxd27DXj
	49GdXwCnS/y7TFgV0EE5ujreb0iVj9LptGcxWj7F2rDjVeJO2Tf7oOYKq239yrYKYQMK
	49EbAZPN8T5ReIuuue1fbixEBYviCDY4MqsbCW74pYM2JlMQnQfFHT4gp1hy96t1n/+x
	kC036/QWTTlXesrMxAhYk09LQaKhXWzQyBxNTcEv1pWkyX3lAwlTsNfYJSQJkGY7r5uQ
	/7FrvJgGtAnkKIjN1bNQBr0fG2xb9tI/1rVGKgqOWPAKMK5RSypsh57YwpBcMBrutrGd
	QA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=443jLebqKaIm9/GoHrFrZtcvDC8pOWNWdhmrfkKybkY=;
	b=LaL9NkSW0pXJaWVKVd3QF/P2UhACoL7RLe4t5zLCnf6CEAj9cBRk58lkvptdI3NOfc
	Cf6dKW07/PUuWNGdWfzY2PQFhZ8xIZC8KjMjfqFzDJL+OLqKNYS1JPZA7k+xiSAi7Ksj
	IuHD5TyJtvb9PnfttEmdtbAWX0OdPojlP96b7ob7tFdi1h1UCnW4VsDyLwJAsFlP6ygI
	XtzY3xWBu4zeaxRULcmfnqvUvh4AExKWfmcL08sdCpE0fHjpkDFXNet6wp8Yz85TCzWj
	JZWWi05EdeHfMTRQZFOV/e81Vfxqj8C7EPXicw2OldukAg3outQU938Ul5H1TgW53Tad
	tRYw==
X-Gm-Message-State: APjAAAUlR4V92to5IeX34v2Fz5DS5OP9JiDF0iPVgs4+3C1zZCUvFp85
	RAjrp467Gcl/nJpsFhR+o6ltQX52o7HCGWmOc1UaEiLqw6g=
X-Google-Smtp-Source: APXvYqx8f9+AHEDIvNLPHX4lq5uNr/6d28mOnagBltCIZrItjMKSLeCntxDbWegMxsLq7uY6Meinb7DStszlmuTqIoY=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr19406958qkg.337.1562731990894; 
	Tue, 09 Jul 2019 21:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <1562091466-29972-1-git-send-email-subhajit_paul@ti.com>
In-Reply-To: <1562091466-29972-1-git-send-email-subhajit_paul@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 21:12:57 -0700
Message-ID: <CAMKF1soEx5gtEv8Wm6X6uaXJYKC_7j7LGeNsanibdE=+dqtwUw@mail.gmail.com>
To: Subhajit Paul <subhajit_paul@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V3] ti-display-sharing: add recipe for fw integration
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
X-List-Received-Date: Wed, 10 Jul 2019 04:13:12 -0000
Content-Type: text/plain; charset="UTF-8"

This fails to build for mips arch see

https://errors.yoctoproject.org/Errors/Details/251213/

please mark this recipe either arm or ti soc specific

this will help meta-ti in multi-BSP distros.

On Tue, Jul 2, 2019 at 11:18 AM Subhajit Paul <subhajit_paul@ti.com> wrote:
>
> Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ti-display-sharing-firmware_git.bb             | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
>
> diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
> new file mode 100644
> index 0000000..675b3f2
> --- /dev/null
> +++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "TI Display Sharing Firmware"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +
> +PV = "00.09.00.00-git${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit deploy
> +inherit update-alternatives
> +
> +PROTOCOL = "git"
> +BRANCH = "ti-linux-firmware"
> +SRCREV = "4a86f16df9b44798851e51fa465825710cda76cf"
> +
> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TI_DISP_SHARE_FW_DIR = "${S}/ti-display-sharing/"
> +TI_DISP_SHARE_FW_FILENAME = "ti-display-sharing-j721e.bin"
> +
> +# make sure that lib/firmware, and all its contents are part of the package
> +FILES_${PN} += "${base_libdir}/firmware"
> +
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware
> +  install -m 0755 ${TI_DISP_SHARE_FW_DIR}/${TI_DISP_SHARE_FW_FILENAME} ${D}${base_libdir}/firmware
> +}
> +
> +TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
> +ALTERNATIVE_${PN} = "j7-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TI_DISP_SHARE_FW_FILENAME}"
> +ALTERNATIVE_PRIORITY = "9"
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} += "arch"
> +
> +# we don't want to configure and build the source code
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

