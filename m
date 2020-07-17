Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1773.1595017970923477482
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 13:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SRmXOhKq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06HKWj8S037133;
	Fri, 17 Jul 2020 15:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595017965;
	bh=uVs/E/4Fx3pujsnjxaXu2ar2oGHj0Z/HQlB6YZVozhY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SRmXOhKqe9RnlaO/m49N/jFXDABeMqfYUB0Va/SIkcx9gTPCBFPy6J+IGsm9j4hWO
	 VBEbiioWZVg1DKRCjhSby0S8cEuBjetm1E8OrOj2QZSD5FAqQ/i15P07mLibW2eVRu
	 eULd3HcJpif/4Wkj92HSXrJnGfox7DiV95tLUkfA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06HKWjg0026999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jul 2020 15:32:45 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 17
 Jul 2020 15:32:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 17 Jul 2020 15:32:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06HKWiTG047931;
	Fri, 17 Jul 2020 15:32:44 -0500
Date: Fri, 17 Jul 2020 16:32:44 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] pru-icss: Replace hardcoded lib with libdir variable
Message-ID: <20200717203244.GG13182@beryl>
References: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu>
MIME-Version: 1.0
In-Reply-To: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK, libdir is usually /usr/lib


On Mon, Jul 13, 2020 at 11:08:32AM +0200, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 316 ++++++++++++++++----------------
>  1 file changed, 158 insertions(+), 158 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 23097d97..4543d708 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -53,7 +53,7 @@ do_compile() {
>  
>  do_install() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -    install -d ${D}/lib/firmware/pru
> +    install -d ${D}${libdir}/firmware/pru
>      install -d ${D}${includedir}
>      cp ${CP_ARGS} ${S}/include/* ${D}${includedir}
>      install -d ${D}${libdir}
> @@ -65,49 +65,49 @@ FILES_${PN}-dev = "${includedir}"
>  
>  do_install_append_ti33x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      for i in 0 1
>      do
>          install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
> -                        ${D}/lib/firmware/pru
> +                        ${D}${libdir}/firmware/pru
>      done
>  }
>  
>  do_install_append_ti43x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>          done
>      done
>  }
>  
>  do_install_append_omap-a15() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      for i in 1 2
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>          done
>      done
>  }
>  
>  do_install_append_k2g() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/k2g/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>          done
>      done
>  }
> @@ -116,20 +116,20 @@ do_install_append_am65xx() {
>      for i in 0 1 
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      done
>      for i in 0 1 2
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>              install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>  
>          done
>      done
> @@ -139,28 +139,28 @@ do_install_append_j7() {
>      for i in 0 1
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${libdir}/firmware/pru
>      done
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/j721e/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>              install -m 0644 ${S}/examples/j721e/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${libdir}/firmware/pru
>  
>          done
>      done
>  }
>  
>  
> -FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt* /lib/firmware/pru/TX_PRU_Halt*"
> -FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* /lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
> +FILES_${PN}-halt = "${libdir}/firmware/pru/PRU_Halt* ${libdir}/firmware/pru/RTU_Halt* ${libdir}/firmware/pru/TX_PRU_Halt*"
> +FILES_${PN}-rpmsg-echo = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt* ${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
>  
>  # Set up names for the firmwares
>  PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
> @@ -171,55 +171,55 @@ PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-f
>  PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
>  
>  # Set up link names for the firmwares
> -ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
> -ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "/lib/firmware/am335x-pru1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "/lib/firmware/am437x-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "/lib/firmware/am437x-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "/lib/firmware/am437x-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "/lib/firmware/am437x-pru1_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "/lib/firmware/am57xx-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "/lib/firmware/am57xx-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "/lib/firmware/am57xx-pru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "/lib/firmware/am57xx-pru2_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "/lib/firmware/k2g-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "/lib/firmware/k2g-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "/lib/firmware/k2g-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "/lib/firmware/k2g-pru1_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "/lib/firmware/am65x-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "/lib/firmware/am65x-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "/lib/firmware/am65x-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "/lib/firmware/am65x-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "/lib/firmware/am65x-pru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "/lib/firmware/am65x-pru2_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "/lib/firmware/am65x-rtu0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "/lib/firmware/am65x-rtu0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "/lib/firmware/j7-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "/lib/firmware/j7-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "/lib/firmware/j7-rtu0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "/lib/firmware/j7-rtu0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "/lib/firmware/j7-rtu1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "/lib/firmware/j7-rtu1_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "/lib/firmware/j7-txpru0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "/lib/firmware/j7-txpru0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "/lib/firmware/j7-txpru1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "${libdir}/firmware/am335x-pru0-fw"
> +ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "${libdir}/firmware/am335x-pru1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "${libdir}/firmware/am437x-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "${libdir}/firmware/am437x-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "${libdir}/firmware/am437x-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "${libdir}/firmware/am437x-pru1_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "${libdir}/firmware/am57xx-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "${libdir}/firmware/am57xx-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "${libdir}/firmware/am57xx-pru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "${libdir}/firmware/am57xx-pru2_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "${libdir}/firmware/k2g-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${libdir}/firmware/k2g-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${libdir}/firmware/k2g-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${libdir}/firmware/k2g-pru1_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "${libdir}/firmware/am65x-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "${libdir}/firmware/am65x-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "${libdir}/firmware/am65x-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "${libdir}/firmware/am65x-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "${libdir}/firmware/am65x-pru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "${libdir}/firmware/am65x-pru2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "${libdir}/firmware/am65x-rtu0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "${libdir}/firmware/am65x-rtu0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "${libdir}/firmware/am65x-rtu1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "${libdir}/firmware/am65x-rtu1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "${libdir}/firmware/am65x-rtu2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "${libdir}/firmware/am65x-rtu2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "${libdir}/firmware/am65x-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "${libdir}/firmware/am65x-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "${libdir}/firmware/am65x-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "${libdir}/firmware/am65x-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "${libdir}/firmware/am65x-txpru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "${libdir}/firmware/am65x-txpru2_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "${libdir}/firmware/j7-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "${libdir}/firmware/j7-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "${libdir}/firmware/j7-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "${libdir}/firmware/j7-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "${libdir}/firmware/j7-rtu0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "${libdir}/firmware/j7-rtu0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "${libdir}/firmware/j7-rtu1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "${libdir}/firmware/j7-rtu1_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "${libdir}/firmware/j7-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "${libdir}/firmware/j7-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "${libdir}/firmware/j7-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "${libdir}/firmware/j7-txpru1_1-fw"
>  
>  # Create the pru-icss-halt firmware alternatives
>  ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
> @@ -228,55 +228,55 @@ ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
>  ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
> -ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "${libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "${libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "${libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "${libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "${libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "${libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "${libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "${libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "${libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "${libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "${libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "${libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "${libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "${libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "${libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "${libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "${libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "${libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "${libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "${libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "${libdir}/firmware/pru/TX_PRU_Halt_1.out"
>  
>  
>  ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
> @@ -284,45 +284,45 @@ ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
>  # Create the pru-icss-rpmsg-echo firmware alternatives
>  ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
>  
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "${libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "${libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
>  
>  ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
>  
> -- 
> 2.17.1
> 

> 

