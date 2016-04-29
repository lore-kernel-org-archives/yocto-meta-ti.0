Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40214E00CB4; Fri, 29 Apr 2016 16:54:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16F95E00CA5
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 16:54:03 -0700 (PDT)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F001J96DLQ000@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 29 Apr 2016 18:53:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mFaJwhpSGNz1EyCl5wsA:9
Received: by 100.15.86.14 with SMTP id 70c651a4; Fri, 29 Apr 2016 23:53:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 32D97161FD1;	Fri,
	29 Apr 2016 19:53:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 29 Apr 2016 19:53:43 -0400
Message-id: <1461974024-2275-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461974024-2275-1-git-send-email-denis@denix.org>
References: <1461974024-2275-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] ti-cgt-pru: suppress already stripped warning
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
X-List-Received-Date: Fri, 29 Apr 2016 23:54:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-cgt-pru_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
index 3cffd24..049682f 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
@@ -40,6 +40,6 @@ FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
                    ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
 "
 
-INSANE_SKIP_${PN} += "arch staticdev"
+INSANE_SKIP_${PN} += "arch staticdev already-stripped"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.2.0


