Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D945E013E5
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 06:26:41 -0700 (PDT)
Received: by lboj14 with SMTP id j14so1911967lbo.35
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 06:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=2Om5zb4Qg1HIvKHdwDTz4NOCvEstQAXEg3uXaok5SAA=;
	b=FPMRVXM90j39Z3fVgOGlkH0RbvIOSEzUGhe5ROBGXyWsiMlR5EexrBD8bbxxvXwq/X
	z1m90iAcNg1vDpl+jhW1dbr0M3gemCDuwSqctHRK2kcYoRPxscV5m7/ljafiAlcOpRBc
	canofTkoWToTOdaIt3/qTOFeOY6/ANRqB8t7t7u1uv+1Me/7LFBmr8LnPyZG+VLOr+xi
	rxGsyK07M5UR3G7yZpMB5eNO/8ds7hLr6jCgJUfgfROvdygbwspIgLmoWcBt7fxxhrZ+
	0pFUK8ilc+2z0sO5t6fT2UitF/JlQnQS0csz4ybwH3cry8X3Xcsv8DCxSr6j5+3vU4DS
	DCQQ==
MIME-Version: 1.0
Received: by 10.152.102.234 with SMTP id fr10mr20885615lab.32.1340803599888;
	Wed, 27 Jun 2012 06:26:39 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Wed, 27 Jun 2012 06:26:39 -0700 (PDT)
Date: Wed, 27 Jun 2012 15:26:39 +0200
Message-ID: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: meta-ti@yoctoproject.org
X-Gm-Message-State: ALoCoQm+WLb3f0cSgf9yYTAteCZH2twqN8r6wvBn6hwHF5gdbJPEcMBp2gMQbopdvhwANJjfHeq9
Subject: gstreamer / ti-dmai component does not build for ti8148-evm
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 13:26:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

building gstreamer for ti8148 fails becasue DMAI does not build:

NOTE: Running task 982 of 1737 (ID: 185,
/SCRATCH/maniac/hidav/meta-texasinstruments/recipes-ti/dmai/ti-dmai_svn.bb,
do_fetch)
NOTE: package ti-dmai-1_2_10_00_01+svnrUNDEFINED_SRCREV-r2o: task
do_fetch: Started
WARNING: Failed to fetch URL
svn://gforge.ti.com/svn/dmai/;module=3DUNDEFINED_DMAIBRANCH;proto=3Dhttps;u=
ser=3Danonymous;pswd=3D''
ERROR: Fetcher failure: Fetch command export HOME=3D"/home/maniac";
export SSH_AGENT_PID=3D"3382"; export
SSH_AUTH_SOCK=3D"/tmp/keyring-qDZ2c2/ssh"; export
GIT_CONFIG=3D"/SCRATCH/maniac/hidav/build/tmp-eglibc/sysroots/x86_64-linux/=
etc/gitconfig";
export PATH=3D"/SCRATCH/maniac/hidav/openembedded-core/scripts:/SCRATCH/man=
iac/hidav/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-li=
nux-gnueabi:/SCRATCH/maniac/hidav/build/tmp-eglibc/sysroots/hidav/usr/bin/c=
rossscripts:/SCRATCH/maniac/hidav/build/tmp-eglibc/sysroots/x86_64-linux/us=
r/sbin:/SCRATCH/maniac/hidav/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin=
:/SCRATCH/maniac/hidav/build/tmp-eglibc/sysroots/x86_64-linux/sbin:/SCRATCH=
/maniac/hidav/build/tmp-eglibc/sysroots/x86_64-linux//bin:/SCRATCH/maniac/h=
idav/openembedded-core/scripts:/SCRATCH/maniac/hidav/bitbake/bin/:/home/man=
iac/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/=
usr/bin:/sbin:/bin:/usr/games";
/usr/bin/env svn co --username anonymous --password '' -r
UNDEFINED_SRCREV
https://gforge.ti.com/svn/dmai//UNDEFINED_DMAIBRANCH@UNDEFINED_SRCREV
UNDEFINED_DMAIBRANCH could not be run:
None
ERROR: Function failed: Fetcher failure for URL:
'svn://gforge.ti.com/svn/dmai/;module=3DUNDEFINED_DMAIBRANCH;proto=3Dhttps;=
user=3Danonymous;pswd=3D'''.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/SCRATCH/maniac/hidav/build/tmp-eglibc/work/hidav-angstrom-linux-gnueabi/ti=
-dmai-1_2_10_00_01+svnrUNDEFINED_SRCREV-r2o/temp/log.do_fetch.11980
NOTE: package ti-dmai-1_2_10_00_01+svnrUNDEFINED_SRCREV-r2o: task
do_fetch: Failed
ERROR: Task 185
(/SCRATCH/maniac/hidav/meta-texasinstruments/recipes-ti/dmai/ti-dmai_svn.bb=
,
do_fetch) failed with exit code '1'


Looking at the recipes in
meta-texasinstruments/recipes-ti/dmai/ti-dmai[.inc | _svn.bb ] there
are DEPENDS, DMAIPLATFORM, DMAIBRANCH and SRCREV defined for cpus
dm6446, dm6467, dm355, dm365, omap3, omapl137, omapl138. dm814x and
dm816x are missing. Why is that? Where can I get the corresponding
branch and srcrev values for these platforms?

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

