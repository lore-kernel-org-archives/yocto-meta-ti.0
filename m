Return-Path: <kpa_info@yahoo.fr>
Received: from nm4.bullet.mail.ird.yahoo.com (nm4.bullet.mail.ird.yahoo.com
	[77.238.189.61])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0B949E00B0A
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 05:01:21 -0800 (PST)
Received: from [77.238.189.50] by nm4.bullet.mail.ird.yahoo.com with NNFMP;
	20 Jan 2012 13:01:20 -0000
Received: from [212.82.108.125] by tm3.bullet.mail.ird.yahoo.com with NNFMP;
	20 Jan 2012 13:01:20 -0000
Received: from [127.0.0.1] by omp1034.mail.ird.yahoo.com with NNFMP;
	20 Jan 2012 13:01:20 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 756064.12630.bm@omp1034.mail.ird.yahoo.com
Received: (qmail 36169 invoked by uid 60001); 20 Jan 2012 13:01:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024;
	t=1327064480; bh=8SaaaB8T6QeQxLGCMGhYjW6123/LXfgOlVUlL3jgSN4=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=2iar5Am+KeZMuACa8kPtwWPDA8KAPGwUFFp2kg3bvdVwclHG+udXzzvO4J3iNpZ8cnuRn8glc7G04e3P9KSWKVJI96FecmnTAlL0kSFbRb79fzhOV1XuVTA5pXWaDMqIquhFw57hUkMK2EfAg8Xc55p30uYXhgOzqRujVCSpxw4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.fr;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=aIBLOwMFeMu8+qeVUxVN2U2PLRV9tYJS/VmSxjvJ8lXUnoNCMkRh7uS3ymYReDmIK4vR37/uyhSyESF1w+OxQAd5I2GsFJNKwVS0c+Z9IikCBO0raAswI1ZseZ1WKaPq1kuUutATL+pTxgjOEF81Jf11duGjJ1ep9U+kZKK1U5E=;
X-YMail-OSG: csOVPysVM1nW8Ot5vvM.xEu8WQA_WuZ_Cj5DukjWV_mqvBH
	jxroiPoH5_50.ehZezkxv2GIxY_stEVnsd5nO5vDLq8fhQzBSgiiZ_IeDxDe
	9VTe0fy_0yshX0DoO5DOn6_xW_7mckiLAdfxdrIgfU99Rz5O.bqLn8mYV5U3
	NyuBGN57rG9ajuQdWG6YGGpEMTBacdMuFz_mqya1q6XBYietmJAXir1XVlW0
	gpyMp2B72BVZJHJWalS26.L.LWmu6QjWO6Xc4jjZa8noenoIyVDrmHKXpKz5
	kNBAC336Ov2f9e0FAH8.1lpdkNBxzdJKYhXrKhAdZh2X3QmPHcmjlVJ3._x2
	2YCL8kLpoZHXoyPQY0F2pcf7SVFXoU71eFElnhvVUz2ys2t_V2jYfOewHtN1 p
Received: from [213.193.97.58] by web29016.mail.ird.yahoo.com via HTTP;
	Fri, 20 Jan 2012 13:01:20 GMT
X-Mailer: YahooMailWebService/0.8.116.331537
References: 
Message-ID: <1327064480.34638.YahooMailNeo@web29016.mail.ird.yahoo.com>
Date: Fri, 20 Jan 2012 13:01:20 +0000 (GMT)
From: Patrick <kpa_info@yahoo.fr>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto-bsp@yoctoproject.org" <yocto-bsp@yoctoproject.org>
MIME-Version: 1.0
Subject: Starting point for a new board
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Patrick <kpa_info@yahoo.fr>
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 13:01:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear mailing-list,=0A=0AI have created a new custom board based on an OMAP4=
430 processor. This board is very close to the Pandaboard.=0AI have already=
 a working bootloader and a working 3.0 kernel, both stored in two git tree=
.=0A=0ANow I would like to build a custom, well optimised, user space rootf=
s for my board, using Yocto.=0AI have red many doc from the yocto project w=
ebsite and I was able to build the beagleboard minimal image and use this r=
ootfs (and my working kernel) with my board.=0ANow I would like to build my=
 own "machine" or "bsp" in Yocto to properly configure which package I need=
.=0A=0ACould you please point me what should be the best approach for this =
? Should I use the meta-ti ? Where to find them? Should I create a new mach=
ine or a new BSP or both ?=0AIf it's help, it's ok for me to use Yocto only=
 for the rootfs and to manage my kernel and my bootloader externaly.=0A=0AT=
hanks in advance for any help !=0A=0APatrick=0A

