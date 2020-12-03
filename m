Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.5013.1607034041611938346
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 14:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e1GnOMTK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-robey@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3MKfaU003842
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Dec 2020 16:20:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607034041;
	bh=6ABzoxSFT/MJVpxHw6yKGVnOPL4wqf2mTWa1jCLvXjk=;
	h=From:To:CC:Subject:Date;
	b=e1GnOMTKHSxjIBoQ9CBlfnRnmA6uzO2mdPVFGJ6LhyRMJp+eq4vHNYu5yDud/4L2W
	 7/Zf2rs/IPzuiQjR93UFLisKWDmGrMYFxQxSDURVFJe18/cb17cg4Gk7S6ZUxlIJ8X
	 pru1lvNbn7eUYj5TLEo7LjGDz7+4j41vTKLnX9Po=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3MKevN013576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Dec 2020 16:20:41 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 16:20:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 16:20:40 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3MKe6c117022;
	Thu, 3 Dec 2020 16:20:40 -0600
Received: from localhost ([10.250.41.121])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0B3MKeIY092906;
	Thu, 3 Dec 2020 16:20:40 -0600
From: "Caleb Robey" <c-robey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>, Lucas Weaver <l-weaver@ti.com>,
        a0232989
	<a0232989@ti.com>, Caleb Robey <c-robey@ti.com>
Subject: [PATCH] [meta-ti][dunfell/master][PATCH] set serverip after dhcp
Date: Thu, 3 Dec 2020 16:19:53 -0600
Message-ID: <20201203221953.26215-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: a0232989 <a0232989@ti.com>

There is a documented issue where the u-boot dhcp command,
when autoboot is set to "no", will reset serverip to the
gateway ip address. This is a workaround that should not
have any negative affect on these scripts and will prevent
this issue for occuring.

Issue:
https://stackoverflow.com/questions/13975468/in-u-boot-can-the-dhcp-command-automatically-set-the-serverip-environment-varia

Note: we display this behavior in older scripts, but dropped
the nomenclature lately and default NFS setups do not work
out of the box as a result.

Signed-off-by: Caleb Robey <c-robey@ti.com>
---
 setup-uboot-env-am335x.sh     | 4 ++--
 setup-uboot-env-am43x.sh      | 2 +-
 setup-uboot-env-am57xx-evm.sh | 2 +-
 setup-uboot-env-am65x.sh      | 5 ++---
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index f129875..687461b 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -189,7 +189,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -198,7 +198,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no; dhcp ;setenv serverip $ip; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 24bc58a..8b8254b 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -144,7 +144,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 323c134..dfd9486 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -156,7 +156,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index b6e043b..60045ae 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -144,14 +144,13 @@ do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 # Configurable settings
-do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv nfs_root $rootpath\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 
 # General macros
 do_expect "\"$prompt\"" "send \"setenv bootcmd 'run findfdt; run envboot; run setup_\${kern_boot}; run init_\${rootfs_boot}; run get_kern_\${kern_boot}; run get_fdt_\${kern_boot}; run get_overlay_\${kern_boot}; run run_kern'\"" $cwd/setupBoard.minicom
 
-do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp; setenv serverip $ip'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs console=\${console} \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
@@ -159,7 +158,7 @@ do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};
 
 do_expect "\"$prompt\"" "send \"setenv nfs_options 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv setup_mmc ''\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv setup_net 'setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv setup_net 'setenv autoload no; dhcp; setenv serverip $ip'\"" $cwd/setupBoard.minicom
 
 
 
-- 
2.17.1

