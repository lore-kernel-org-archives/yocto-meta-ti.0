Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB328C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:44:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.80625.1754023488244823581
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 21:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Vd/DyTa6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5714ikLO3162861;
	Thu, 31 Jul 2025 23:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754023486;
	bh=6Bso6n3ygUbYL9XWQigrRUl6Moem6a9XZG+rmmgMDuA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Vd/DyTa6jGcF+QFeic3UXEU1W+GN6P6XyYnVWiodDyRI2Gow9wpQohdFeCxJkpBZx
	 Va1t4NJihAwzAYc+GOoqpBm/peMVYhgxNOaBSp4P0ezCXe1mwb78iCYLb22zJ+hmNS
	 AoB0OYL4949Da0jIiiE7rm2PibJ99EDPpM19gZiw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5714ikvt3831750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 23:44:46 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 23:44:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 23:44:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5714if0I3708319;
	Thu, 31 Jul 2025 23:44:44 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 1/2] licenses: Add a LICENSE for PKA Firmware
Date: Fri, 1 Aug 2025 10:14:40 +0530
Message-ID: <20250801044441.1059527-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801044441.1059527-1-b-padhi@ti.com>
References: <20250801044441.1059527-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 5714ikLO3162861
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 04:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18865

Add a LICENSE for the PKA Firmware, picked from ti-linux-firmware
repository which also has the firmware.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/licenses/PKA-FW | 100 ++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 meta-ti-bsp/licenses/PKA-FW

diff --git a/meta-ti-bsp/licenses/PKA-FW b/meta-ti-bsp/licenses/PKA-FW
new file mode 100644
index 00000000..56a38461
--- /dev/null
+++ b/meta-ti-bsp/licenses/PKA-FW
@@ -0,0 +1,100 @@
+//
+//  TEXAS INSTRUMENTS TEXT FILE LICENSE
+//
+//   Copyright (c) 2016-2020 Texas Instruments Incorporated
+//
+//  All rights reserved not granted herein.
+//
+//  Limited License.
+//
+//  Texas Instruments Incorporated grants a world-wide, royalty-free,
+//  non-exclusive
+//  license under copyrights and patents it now or hereafter owns or con=
trols to
+//  make, have made, use, import, offer to sell and sell ("Utilize") thi=
s
+//  software
+//  subject to the terms herein.  With respect to the foregoing patent l=
icense,
+//  such license is granted  solely to the extent that any such patent i=
s
+//  necessary
+//  to Utilize the software alone.  The patent license shall not apply t=
o any
+//  combinations which include this software, other than combinations wi=
th
+//  devices
+//  manufactured by or for TI (=E2=80=9CTI Devices=E2=80=9D).  No hardwa=
re patent is licensed
+//  hereunder.
+//
+//  Redistributions must preserve existing copyright notices and reprodu=
ce this
+//  license
+//  (including the above copyright notice and the disclaimer and (if app=
licable)
+//  source
+//  code license limitations below) in the documentation and/or other ma=
terials
+//  provided
+//  with the distribution.
+//
+//  Redistribution and use in binary form, without modification, are per=
mitted
+//  provided
+//  that the following conditions are met:
+// 	No reverse engineering, decompilation, or disassembly of this softwa=
re
+// 	is
+//   permitted with respect to any software provided in binary form.
+// 	Any redistribution and use are licensed by TI for use only with TI
+// 	Devices.
+// 	Nothing shall obligate TI to provide you with source code for the
+// 	software
+//   licensed and provided to you in object code.
+//
+//  If software source code is provided to you, modification and redistr=
ibution
+//  of the
+//  source code are permitted provided that the following conditions are=
 met:
+// 	Any redistribution and use of the source code, including any resulti=
ng
+// 	derivative
+//   works, are licensed by TI for use only with TI Devices.
+// 	Any redistribution and use of any object code compiled from the sour=
ce
+// 	code
+//   and any resulting derivative works, are licensed by TI for use only=
 with TI
+//   Devices.
+//
+//  Neither the name of Texas Instruments Incorporated nor the names of =
its
+//  suppliers
+//  may be used to endorse or promote products derived from this softwar=
e
+//  without
+//  specific prior written permission.
+//
+//  DISCLAIMER.
+//
+//  THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" A=
ND ANY EXPRESS
+//  OR IMPLIED
+//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+//  MERCHANTABILITY
+//  AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHA=
LL TI
+//  AND TI=E2=80=99S
+//  LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+//  EXEMPLARY, OR
+//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+//  SUBSTITUTE
+//  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERR=
UPTION)
+//  HOWEVER
+//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+//  LIABILITY, OR TORT
+//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF
+//  THIS SOFTWARE,
+//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+
+//---------------------------------------------------------------------
+//Inside Secure Copyright Notice for PKA Firmware
+//---------------------------------------------------------------------
+
+/* */
+/* Copyright (c) 2004-2015 INSIDE Secure B.V. All Rights Reserved */
+/* */
+/* This confidential and proprietary software may be used only as author=
ized */
+/* by a licensing agreement from INSIDE Secure. */
+/* */
+/* The entire notice above must be reproduced on all authorized copies t=
hat */
+/* may only be made to the extent permitted by a licensing agreement fro=
m */
+/* INSIDE Secure. */
+/* */
+/* For more information or support, please go to our online support syst=
em at */
+/* https://essoemsupport.insidesecure.com. */
+/* In case you do not have an account for this system, please send an e-=
mail */
+/* to ESSEmbeddedHW-Support.com. */
+/*----------------------------------------------------------------------=
------*/
--=20
2.34.1


