Return-Path: <heroor@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EA9BE013EC
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:31:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61DVtHw016421
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:31:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61DVtsl025580
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:31:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 08:31:55 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r61DVqFD008254;	Mon, 1 Jul 2013 08:31:53 -0500
Message-ID: <51D184C8.5070500@ti.com>
Date: Mon, 1 Jul 2013 19:01:52 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Dmytriyenko, Denys" <denys@ti.com>
References: <20130701123155.GA16127@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E828F48@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E828F48@DLEE08.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Mon, 01 Jul 2013 13:31:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/1/2013 6:57 PM, Dmytriyenko, Denys wrote:
> Any chance to unify on a recipe name?

Not sure I follow, but do you mean between the OMAP3 Graphics SDK and
the OMAP5 libgles DDK?

> 
> 
> Denys
> 
> 
> -----Original Message-----
> *From:* Hingolikar, Mrinmayee [mrinmayee@ti.com]
> *Received:* Monday, 01 Jul 2013, 8:32
> *To:* meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> *Subject:* [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
> libraries for graphics acceleration
> 
> * These libraries are not distributable in source and hence
>   are available only as binary. They implement OpenGLES 1.x and
>   OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
>   class of devices.
> 
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24
> ++++++++++++++++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> 
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> new file mode 100644
> index 0000000..d3a847d
> --- /dev/null
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Userspace libraries for sgx"
> +HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> +LICENSE = "TI"
> +DEPENDS = ""
> +
> +SRC_URI =
> "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-${PV}.tar.gz;protocol=http"
> +
> +LIC_FILES_CHKSUM =
> "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
> +
> +PR = "r1"
> +
> +SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D}
> +}
> +
> +PACKAGES =+ "${PN}-${PV}"
> +
> +FILES_${PN} =  "${bindir}/*"
> +FILES_${PN} += " ${libdir}/*"
> +FILES_${PN} +=  "${includedir}/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


