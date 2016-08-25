Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7138E01093; Thu, 25 Aug 2016 10:09:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F343AE0108D
	for <meta-ti@yoctoproject.org>; Thu, 25 Aug 2016 10:09:29 -0700 (PDT)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCH000O36BAP060@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 25 Aug 2016 12:09:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=iGHA9ds3AAAA:8
	a=24v_QF2FEXwY1HS7Q7gA:9
Received: by 100.15.86.14 with SMTP id 626e8f96; Thu, 25 Aug 2016 17:09:10 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id A23C9161A44;	Thu, 25 Aug 2016 13:09:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 25 Aug 2016 13:09:05 -0400
Message-id: <1472144947-3217-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] README: add note about list subscription
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
X-List-Received-Date: Thu, 25 Aug 2016 17:09:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README b/README
index 61ed5a3..39dde59 100644
--- a/README
+++ b/README
@@ -19,5 +19,7 @@ Please follow the recommended setup procedures of your OE distribution.
 
 
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
+Please note - meta-ti mailing list requires subscription for posting:
+https://lists.yoctoproject.org/listinfo/meta-ti
 
 Maintainers: Denys Dmytriyenko <denys@ti.com>
-- 
2.7.4


