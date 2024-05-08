Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59790C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 21:52:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.484.1715205145331222031
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 14:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z0Xdz7EM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 275C11BF203;
	Wed,  8 May 2024 21:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715205143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=6atVr959FRz4yf+vGcJmUW7skBaSzkfMD6IYUrisFPY=;
	b=Z0Xdz7EMHmKIa6X2ESpikCpZwyfnZeG5Kv59BYKaXIdA4t7oj9lP7/GW1t3bZw0mTF6UVr
	T8j/JGrkanESLfYHS7XGgYrsEAvE9NMPjmiooB54dcxgsoX0J2DavyJJ/XovJy4Ld+c+0D
	bWKIt98lu8P+RFhtleh+okVHLWG+aq1RhPe+G1nd5iJdeyoy7Q6FfYpCdfgYUBR18OFe7G
	sU/Bfgh44eFE1inzlGiZze2LpKXqIasPAEyDsFpmOb7fs067iVdjdB9BVB1b5kTseO0E6b
	oFHCDLXcMOzWhNBZ6MOUsd+e/d6zN9ffik7ueyOG8/E+TyAsMKtiElnH023i6w==
Date: Wed, 8 May 2024 23:52:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <20240508215222b967f0db@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 May 2024 21:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17648

Hello,

meta-ti is currently failing check-layer-nightly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2063/steps/20/logs/stdio

INFO: ======================================================================
INFO: FAIL: test_signatures (common.CommonCheckLayer.test_signatures)
INFO: ----------------------------------------------------------------------
INFO: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/check-layer-nightly/build/scripts/lib/checklayer/cases/common.py", line 99, in test_signatures
    self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
AssertionError: Adding layer meta-ti-extras changed signatures.
19 signatures changed, initial differences (first hash before, second after):
   python3-yamllint:do_recipe_qa: 8ee2e91624905aa91d611870e9d8cf0d1fb6bc248f181cb9f9f9c35198cd2ec6 -> 7d43e16b2e61b0e319270b32ff19a39960e99a77af1fdabbd2f3610066344a3f
      bitbake-diffsigs --task python3-yamllint do_recipe_qa --signature 8ee2e91624905aa91d611870e9d8cf0d1fb6bc248f181cb9f9f9c35198cd2ec6 7d43e16b2e61b0e319270b32ff19a39960e99a77af1fdabbd2f3610066344a3f
      NOTE: Starting bitbake server...
      basehash changed from 8a578aebd04ba58b12e29b5eef3f92aaafba21aed33f40ab80f6d93689da0241 to 842db39ba0f9c7db1959bf577c83fb1455216b8c38f8e9822b3be7275048d240
      Variable ERROR_QA value changed:
      @@ -1,2 +1,2 @@
      -dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)} patch-status
      +dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}
       DISTRO_FEATURES{usrmerge} = Unset
      Variable PV value changed from '1.35.1' to '1.33.0'
      Variable SRC_URI[sha256sum] value changed from '7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd' to '2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d'


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

